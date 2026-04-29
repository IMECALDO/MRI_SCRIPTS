#!/bin/bash
#$ -S /bin/bash
#$ -N conn_denoise
#$ -o /misc/milagros2/arandacm/conn_test_2/o
#$ -e /misc/milagros2/arandacm/conn_test_2/e
#$ -cwd
#$ -t 1-50

echo "Starting"

# Mejor manejo de errores
set -e
set -u

#COMO SE VA A SOMETER EL JOB A UNA MAQUINA DEL CLUSTER, ES BUENA PRACTICA CARGAR EL MODULO Y CHECAR SI LA MÁQUINA A LA QUE SE LE ASIGNO, PUEDE EJECUTAR MATLAB, PARA ESO LAS SIGUIENTES LINEAS

module load matlab || {
    echo "ERROR: No se pudo cargar el módulo de MATLAB"
    exit 1
}

# Verificar que los archivos existen antes de ejecutar. ESTAS LINEAS SON LAS QUE VAS A IR CAMBIANDO, SEGUN LA CARPETA DONDE SE VAN GUARDANDO LOS SCRIPTS .m DE TU ANALISIS, PREPROCESAMIENTO O SETUP.

PATHDEFFILE="/misc/milagros2/arandacm/matlab/INITIAL.m"

# Make an array of subject folders
NODEFILES=(conn_project02.qlog/260428155230947/node_*.m)

# Pick the subject based on the task ID
NODEFILE=${NODEFILES[$((SGE_TASK_ID-1))]}

echo $NODEFILE
var="${NODEFILE:41:-2}"
echo $var

if [[ -f "conn_project02."$var".dmat" ]]; then
        echo "Node already done"
else
    echo "Node running"

    if [[ ! -f "$PATHDEFFILE" ]]; then
        echo "ERROR: No se encuentra el archivo $PATHDEFFILE"
        exit 1
    fi

    if [[ ! -f "$NODEFILE" ]]; then
        echo "ERROR: No se encuentra el archivo $NODEFILE"
        exit 1
    fi

    #AHORA SI, YA SE VERIFICO QUE HAY MATLAB, HAY CARPETAS EJECUTABLES Y SCRIPT QUE SOMETER, A CORRER

    echo "Iniciando procesamiento MATLAB..."
    /usr/local/MATLAB/R2023a/bin/matlab -nodisplay -nosplash -r \
        "try, \
        run('$PATHDEFFILE'); \
        fprintf('=== OPTIMIZAR CONFIGURACIÓN ===\\n'); \
        [status, result] = system('df -h . | head -2'); disp(result); \
        spm('defaults', 'FMRI'); \
        global defaults; \
        defaults.images.write.uint8 = 1; \
        spm('Clean'); spm('Clear'); \
        fprintf('=== INICIANDO PROCESAMIENTO PRINCIPAL ===\\n'); \
        run('$NODEFILE'); \
        fprintf('=== LIMPIEZA FINALIZADA EN tmp ===\\n'); \
        catch e, disp(getReport(e)); exit(1); end; exit(0);"

    echo "Procesamiento completado exitosamente"

fi

exit 0