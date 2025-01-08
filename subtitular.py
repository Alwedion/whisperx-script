import whisperx, os

# Buscar video y cambiar nombre para subtitular
for archivo in os.listdir("."):
    if archivo.endswith(".mp4"):
        NOMBRE =(archivo)
        os.rename(archivo,"subtitular.mp4")
        nombreNuevo = "subtitular.mp4"

# Ejecutar comandos CMD para subtitular video usando la placa de video
os.system('cmd /C "whisperx --model medium --device cuda --language es --compute_type int8 --align_model WAV2VEC2_ASR_LARGE_LV60K_960H --highlight_words True subtitular.mp4"')

# Volver a cambiar el nombre del video al nombre original
os.rename('subtitular.mp4',os.path.basename(NOMBRE).split('.')[0]+'.mp4')

# Cambiar el nombre del archivo de subtitulo SRT y ASS al nombre del video 
for subtitulo in os.listdir("."):
    if subtitulo.endswith(".srt"):
        os.rename(subtitulo,os.path.basename(NOMBRE).split('.')[0]+'.srt')
    elif subtitulo.endswith(".ass"):
        os.rename(subtitulo,os.path.basename(NOMBRE).split('.')[0]+'.ass')

# Borrar archivos que no se usan
for borrar in os.listdir("."):
    if borrar.endswith(("tsv","txt","vtt","json")):
        os.remove(borrar)
    elif borrar.endswith(("word.srt")):
        os.remove(borrar)