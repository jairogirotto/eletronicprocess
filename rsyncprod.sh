#!/bin/sh

# PLATAFORMA: Linux

# FINALIDADE: Este script visa facilitar a colocação de fontes em produção do eprocV2
#             usando a ferramenta rsync(www.samba.org/rsync/).

# AUTORES: Jairo Girotto, Joner Cyrre Worm- trf4, Rodolfo Luis de Souza - sjrs;

# REVISION 1.6   COMMENTS, IDENTS AND GARBAGE REMOVE BY  jct trf4 
# REVISION 1.5   Inserido  TNU, nohs 1-4,  WS, CRON, DOWN
# REVISION 1.2   opção homologa trocado $LPATH - $LPATH_HOMOLOGA - Jairo Girotto TRF4 26/03/2014
# REVISION 1.1   acrescentada opção de teste) - Jairo Girotto TRF4
# REVISION 1.0   07/01/2010 - Script com passagem de Parâmetros
# REVISION: 0.1  novembro de 2009
#


# set -n   # Tire comentário para vereficar sua sintaxe, sem executar
           # NOTA: Não esqueça de colocar o comentário de volta , ou
           #       então o shell script não será executado!


# LOAD ssh key 

    oSHENV='/root/linux-jct-rsync-key.env'

    [ -r "$SSHENV" ] && . "$SSHENV"

    if ! /bin/ps $SSH_AGENT_PID >/dev/null 2>&1; then
        /usr/bin/ssh-agent >"$SSHENV"
        . "$SSHENV"
        /usr/bin/ssh-add
    fi

    [ -r "$SSHENV" ] && . "$SSHENV"

    RSYNC='/usr/bin/rsync'
    SSH=/usr/bin/ssh
    KEY=/home/eprocfontes/eprocsyncfontes_key

    # deprecated 
     KEY2=/home/eprocfontes/eprocsyncfontes_key

    RUSER=eprocweb

    SUPERUSER=root

 # END LOAD ssh key   




# SERVERS APPs RS ###################################################################################


        RHOST_APPLICRS_NOH1='10.2.30.111'
        RHOST_APPLICRS_NOH2='10.2.30.112'
        RHOST_APPLICRS_NOH3='10.2.30.113'
        RHOST_APPLICRS_NOH4='10.2.30.114'
        RHOST_APPLICRS_WS1='10.2.30.116'
        RHOST_APPLICRS_WS2='10.2.30.117'
        RHOST_APPLICRS_NOH8='10.2.30.118'
        RHOST_APPLICRS_WS_CE='10.2.30.119'    # eproc-ws-ce.jfrs.jus.br - ws para consulta publica portal
        RHOST_APPLICRS_NOH9='10.2.30.129'
        RHOST_APPLICRS_NOH10='10.2.30.130'
        RHOST_APPLICRS_NOH11='10.2.30.131'

        RHOST_APPLICRS_DOWN='10.2.30.141'
        RHOST_APPLICRS_NOH12='10.2.30.150'
        RHOST_APPLICRS_NOH13='10.2.30.151'
        RHOST_APPLICRS_NOH14='10.2.30.152'
        RHOST_APPLICRS_NOH15='10.2.30.153'
        RHOST_APPLICRS_NOH16='10.2.30.201'
        RHOST_APPLICRS_NOH17='10.2.30.154'
        RHOST_EPROCRS_CRONTAB='10.2.30.135'
        RHOST_EPROCRS_SELOCNJ='10.2.30.155'
        RHOST_EPROCRS_APP='10.2.30.157'
        RHOST_EPROCRS_AUTO='10.2.30.160'

# FIM RS //////////////////////////////////////////////////////////////////////////////////////////////


# Server consulta em TRF4
    HOST_APPLICRS_CONSULTA=10.1.30.105  # SERVER NO TRF4


# Homologação TRF4

    RHOST_HOMOLOGACAO_TRF4=10.1.30.251
    RHOST_HOMOLOGACAO_SIGILO=10.1.3.252

# SERVERS DE SC ///////////////////////////////////////////////////////////////////////////////////////////

        # nohs deprecated - verify

        RHOST_APPLICSC1='10.5.3.24'
        RHOST_APPLICSC2='10.5.70.197'
        
        # end

       

        RHOST_APPLICSC_NOH1='10.5.70.21'
        RHOST_APPLICSC_NOH2='10.5.70.22'
        RHOST_APPLICSC_NOH3='10.5.70.23'
        RHOST_APPLICSC_NOH4='10.5.70.24'
        RHOST_APPLICSC_NOH5='10.5.70.25'
        RHOST_APPLICSC_NOH7='10.5.70.27'
        RHOST_APPLICSC_SELOCNJ='10.5.70.39'
        HOST_APPLICSC_APP='10.5.70.15'


        RHOST_APPLICSC_WS1='10.5.70.29' # eproc-ws.jfsc.jus.br
        RHOST_APPLICSC_WS2='10.5.70.30' # eproc-ws2.jfsc.jus.br

        RHOST_APPLICSC_DOWN='10.5.70.50' # eproc-down.jfsc.jus.br


        HOST_APPLICSC_CONSULTA='10.1.30.106'  # SERVER NO TRF4

# FIM SERVERS SC ///////////////////////////////////////////////////////////////////////////////////////////


# SERVERS DE PR ///////////////////////////////////////////////////////////////////////////////////////////////

        RHOST_APPLICPR1=10.7.123.16 
        RHOST_APPLICPR2=10.7.123.17
        RHOST_APPLICPR4=10.7.123.13
        RHOST_APPLICPR5=10.7.123.12
        RHOST_APPLICPR_NOH1=10.7.123.1
        RHOST_APPLICPR_NOH2=10.7.123.2
        RHOST_APPLICPR_NOH3=10.7.123.3
        RHOST_APPLICPR_NOH4=10.7.123.4
        RHOST_APPLICPR_NOH5=10.7.123.5
        RHOST_APPLICPR_NOH6=10.7.123.6
        RHOST_APPLICPR_NOH7=10.7.123.7
        RHOST_APPLICPR_NOH8=10.7.123.8
        RHOST_APPLICPR_NOH9=10.7.123.9
        RHOST_APPLICPR_NOH10=10.7.123.10
        RHOST_APPLICPR_WS1=10.7.123.18
        RHOST_APPLICPR_WS2=10.7.123.102

        RHOST_APPLICPR_DOWN=10.7.123.30

        HOST_APPLICPR_CONSULTA=10.1.30.107  # SERVER NO TRF4

        RHOST_APPLICPR_CRON=10.7.123.229

        RHOST_APPLICPR_SELOCNJ=10.7.123.31

        RHOST_APPLICPR_APP=10.7.123.70

#FIM APP PR ///////////////////////////////////////////////////////////////////////////////////////////////////


# SERVIDORES APP TNU //////////////////////////////////////////////////////////////////////////////////////////

        # novos servers de aplicação  - com  Red Hat

        RHOST_APPLICTNU_NOH1=10.1.30.71
        RHOST_APPLICTNU_NOH2=10.1.30.72
        RHOST_APPLICTNU_NOH3=10.1.30.73
        RHOST_APPLICTNU_NOH4=10.1.30.74

        RHOST_APPLICTNU_WS1=10.1.30.81
        RHOST_APPLICTNU_DOWN=10.1.30.84
        RHOST_APPLICTNU_CRON=10.1.30.85
        RHOST_APPLICTNU_APP=10.1.30.124


# FIM APP TNU /////////////////////////////////////////////////////////////////////////////////////////////////



# SERVERS APP TRF4 ////////////////////////////////////////////////////////////////////////////////////////////



        # novos servers de aplicação  - com  Red Hat
        RHOST_APPLICTRF4_NOH1=10.1.30.101
        RHOST_APPLICTRF4_NOH2=10.1.30.102
        RHOST_APPLICTRF4_NOH3=10.1.30.103
        RHOST_APPLICTRF4_NOH4=10.1.30.104

        RHOST_APPLICTRF4_NOH5=10.1.30.201
        RHOST_APPLICTRF4_NOH6=10.1.30.202 ##php56##
        #RHOST_APPLICTRF4_NOH7=10.1.30.208 ## rls
        RHOST_APPLICTRF4_NOH7=10.1.30.203
        RHOST_APPLICTRF4_NOH8=10.1.30.204
        RHOST_APPLICTRF4_NOH9=10.1.30.205

        RHOST_APPLICTRF4_SELO=10.1.30.210

        RHOST_APPLICTRF4_PERM=10.1.30.208
        RHOST_EPROCTRF4_SELOCNJ=10.1.30.210

        ### WS

        RHOST_APPLICTRF4_WS=10.1.30.110
        RHOST_APPLICTRF4_WS2=10.1.30.111 # JCT em 11/01/2012
        RHOST_APPLICTRF4_WS3=10.1.30.163 # TFF em 08/04/2016
        RHOST_APPLICTRF4_WS_CONSULTA=10.1.30.120 # JCT em 11/01/2012
        RHOST_APPLICTRF4_DOWN=10.1.30.115

        RHOST_APPLICTRF4_APP=10.1.30.123


#FIM APPs TRF4 ////////////////////////////////////////////////////////////////////////////////////////////////

# SERVERS APP APRESENTAÇÃO ////////////////////////////////////////////////////////////////////////////////////
#
#
        RHOST_APRESENTACAO_1G=10.1.30.254
        RHOST_APRESENTACAO_2G=10.1.30.164
#
#
# FIM APP APRESENTAÇÃO ////////////////////////////////////////////////////////////////////////////////////////


# SERVER APP HOMOLOGAÇÃO 2G TRF4 ////////////////////////////////////////////////////////////////////////////////

        RHOST_EPROCTRF4_HOMOLOGACAO=10.1.30.149
        RPATH_EPROCTRF4_HOMOLOGACAO=/opt/eprocv2/homologa_2g


# FIM HOMOLOGALÇAO ////////////////////////////////////////////////////////////////////////////////////////////







# HOMOLOGAÇÃO 1 GRAU //////////////////////////////////////////////////////////////////////////////////////////

    RHOST_EPROC_1G_HML_APLIC1_RS=10.2.30.2
    RHOST_EPROC_1G_HML_APLIC2_RS=?
    RPATH_EPROC_1G_HML_APLIC=/var/www/html/homologa_1g

# FIM HOMOLOGAÇÃO 1 GRAU //////////////////////////////////////////////////////////////////////////////////////


# PATH DEPLOY DESTINO EPROC 4 REGIÃO //////////////////////////////////////////////////////////////////////////

    NEW_RPATH_PRODUCAO_2='/var/www/html/eprocV2/' # Novo path do DocumentRoot Distro RedHat 7 Enterprise


# PATH DEPLOY DESTINO TNU 

    NEW_RPATH_PRODUCAO_TNU='/var/www/html/eproc/' # Novo path do DocumentRoot Distro RedHat 7 Enterprise

# FIM  PATH DESTINO ///////////////////////////////////////////////////////////////////////////////////////////

# PATH ORIGEM DEPLOY 

    LPATH=/dados/eclipse/workspace/eproc2_producao/   # Path dos arquivos que serão sincronizados
    LPATH_HOMOLOGA=/dados/eclipse/workspace/eproc2_homologacao/ # Jairo Girotto em 25/03/2014 - solicitação "juju"

# FIM PATH ORIGEM /////////////////////////////////////////////////////////////////////////////////////////////



# SETTING LOG FILES //////////////////////////////////////////////////////////////////////////////////////////

    LOG_FILE=/var/log/logFontesProdEproc/rsyncprod.`date +%"Y-%m-%d"`.log
    LOGFILERSYNC=/var/log/logFontesProdEproc/rsynclogfile.`date +%"Y-%m-%d"`.log
    if [ ! -f $LOGFILERSYNC ]
    then
    LOGFILERSYNC=/var/log/logFontesProdEproc/rsynclogfile.`date +%"Y-%m-%d"`.log
    fi

    if [ ! -f $LOG_FILE ]
    then
        LOG_FILE=/var/log/logFontesProdEproc/rsyncprod.`date +%"Y-%m-%d"`.log
    fi
    
# END SETTING LOG FILES ///////////////////////////////////////////////////////////////////////////////////////


# SETTING FILE LIST  FOR DEPLOY ///////////////////////////////////////////////////////////////////////////////

    FILELIST='/dados/eclipse/workspace/eproc2_producao/fontes_producao/lista_arquivos_producao.txt'

# END SETTING FILE LIST  FOR DEPLOY ///////////////////////////////////////////////////////////////////////////


# PATH DEPLOY APP Apresentação

    RPATH_APRESENTACAO_2G='/var/www/html/apresenta_2g/'
    RPATH_APRESENTACAO_1G='/var/www/html/apresenta_1g/'

# END PATH





echo "KEEP CALM BREATHE..GET A COFFE AND ENJOY THIS MOMMENT ..SETTING PERMISSIONS "

/usr/bin/find /dados/eclipse/workspace/eproc2_producao/  -mmin -180 -type f   ! -path "/dados/eclipse/workspace/eproc2_producao/tools/*" ! -path  "/dados/eclipse/workspace/eproc2_producao/fontes_producao/*"  -exec /bin/chmod 0644 {} \;
## /usr/bin/find /dados/eclipse/wo rkspace/eproc2_producao/ -type d ! -path "/dados/eclipse/workspace/eproc2_producao/tools/" ! -path  "/dados/eclipse/workspace/eproc2_producao/fontes_producao/"  -exec /bin/chmod 2750 {} \;

echo "ATRIBUÍNDO PERMISSÕES ...AGUARDE"




# ACERTA PERMISSÕES LOCAIS ////////////////////////////////////////////////////////////////////////////////////

permissoes_locais() {

    PLPATH="$1"; shift

    echo "ATRIBUÍNDO PERMISSÕES ...AGUARDE"

    sudo chown -R eprocfontes:eprocfontes "$PLPATH"

    [ ! -d "$PLPATH" ] && return -1

# estava como 0270
   sudo  /usr/bin/find "$PLPATH" -type d -exec sudo  /bin/chmod 2755 {} \;

# estava como 0640
   sudo  /usr/bin/find "$PLPATH" -type f -exec sudo  /bin/chmod 0644 {} \;

    for DIR in bin tools
    do
        LDIR="$PLPATH/$DIR"
        [ ! -d "$LDIR" ] && return -2
        for TIPO in 'x-executable' 'x-shellscript'
        do
            sudo /usr/bin/find "$LDIR" -exec /usr/bin/file -ip {} \; | /bin/grep "$TIPO" | while read L; do ARQ=`echo $L | cut -d: -f1 | cut -d\  -f1`; sudo  chmod +x "$ARQ"; done
        done
    done

    echo "FIM  PERMISSÕES "

    # /usr/bin/find "$LPATH/tools/rsyncprod.sh" -type f -exec /bin/chmod +x {} \;

}

# END PERMISSÕES LOCAIS ///////////////////////////////////////////////////////////////////////////////////////



# PATH WEBINFRA LOCAL/REMOTE //////////////////////////////////////////////////////////////////////////////////

    LPATH_WEBINFRA=/mnt/webinfra/

    RPATH_WEBINFRA=/var/www/html/


# END PATH WEBINFRA



# PARAMETERS OPTIONS
# -v = verbose
# -r = recursive
# -a = archive
#

declare -a REPOSITORIO
IND=0
 for REPO in rs sc pr trf4 tnu homologa permissao apresentacao
##  for REPO in rs sc pr trf4 homologa permissao apresentacao
##  for REPO in homologa rs
do
    REPOSITORIO[((IND++))]="$REPO"
done

lista_repositorios() {
    echo "Repositorios:"
    echo "============"
    for REPO in ${REPOSITORIO[*]}
    do
        echo $REPO
    done
}

permissoes() {
    KEY="$1"; shift
    RUSER=$1; shift
    RHOST=$1; shift
    RPATH="$1"; shift
    RGROUP=${1:-'www'}; shift
    RHTTPD_USER=${1:-'wwwrun'}; shift
    SSH='/usr/bin/ssh'
    $SSH -i "$KEY" $RUSER@$RHOST /usr/bin/find "$RPATH" \-type d \-a ! -user $RHTTPD_USER \-exec chown ${RUSER}.${RGROUP} {} \\\;
    $SSH -i "$KEY" $RUSER@$RHOST /usr/bin/find "$RPATH" \-type d \-a ! -user $RHTTPD_USER \-exec chmod 2750 {} \\\;
    $SSH -i "$KEY" $RUSER@$RHOST /usr/bin/find "$RPATH" \-type f \-a ! -user $RHTTPD_USER \-exec chown ${RUSER}.${RGROUP} {} \\\;
    $SSH -i "$KEY" $RUSER@$RHOST /usr/bin/find "$RPATH" \-type f \-a ! -user $RHTTPD_USER \-exec chmod 0640 {} \\\;
    $SSH -i "$KEY" $RUSER@$RHOST /usr/bin/find "$RPATH/bin"   \-type f \-exec chmod 0550 {} \\\;
    $SSH -i "$KEY" $RUSER@$RHOST /usr/bin/find "$RPATH/tools" \-type f \-a -name \"*.sh\" \-exec chmod 0550 {} \\\;
}




# RSYNC MAIN FUNCTION ///////////////////////////////////////////////////////////////////////////////////////// 

    erressinque() {



        local LOGFILERSYNC=$1; shift
        local KEY=$1; shift
        local LPATH=$1; shift
        local RUSER=$1; shift
        local RHOST=$1; shift
        local RPATH=$1; shift
        local LOG_FILE=$1; shift
        local RGROUP=$1; shift
        local RHTTPD_USER=$1; shift
        local SSH='/usr/bin/ssh'
        local RSYNC='/usr/bin/rsync'
        #  HTTPD_CONFS='/etc/httpd/conf/httpd.conf /usr/local/apache2/conf/httpd.conf  /etc/apache2/httpd.conf /etc/apache2/uid.conf'
        local HTTPD_CONFS='/etc/httpd/conf/httpd.conf'
        case "$MODOTRANSF" in
        all)
            $RSYNC -Cravzp $MODODRYRUN --log-file="$LOGFILERSYNC" --omit-dir-times  --exclude-from='rsyncprod_exclude.txt' --include=*.exe -e "$SSH -i $KEY" "$LPATH" $RUSER@$RHOST:"$RPATH"  >> "$LOG_FILE"
            ;;
        file)
            #    para habilitar sinc. via arquivo
            $RSYNC -Cravzp $MODODRYRUN --log-file="$LOGFILERSYNC" --omit-dir-times  --exclude-from='rsyncprod_exclude.txt' --delete-excluded --files-from='../fontes_producao/lista_arquivos_producao.txt' --include=*.exe  -e "$SSH -i $KEY" "$LPATH"  $RUSER@$RHOST:"$RPATH"  >> "$LOG_FILE"
            ;;
        esac


        if [ -z "$RGROUP" ]; then
            for HTTPD_CONF in $HTTPD_CONFS
            do
                GROUP_CONF=`$SSH -i "$KEY" $RUSER@$RHOST /bin/grep -i ^group "$HTTPD_CONF" 2>/dev/null | /usr/bin/cut -d\  -f2`
                [ -z "$GROUP_CONF" ] || break
            done
        fi
        RGROUP=${RGROUP:-"$GROUP_CONF"}
        echo "Grupo: $RGROUP" >&2
        if [ -z "$RHTTPD_USER" ]; then
            for HTTPD_CONF in $HTTPD_CONFS
            do
                RHTTPD_USER=`$SSH -i "$KEY" $RUSER@$RHOST /bin/grep -i ^user "$HTTPD_CONF" 2>/dev/null | /usr/bin/cut -d\  -f2`
                [ -z "$RHTTPD_USER" ] || break
            done
        fi
        echo "User: $RHTTPD_USER" >&2
        # permissoes $KEY $RUSER $RHOST "$RPATH" $RGROUP $RHTTPD_USER

        echo "" > /tmp/saida_wget.txt
        echo "" > /tmp/saida.txt
        local PATH_RAIZ=`echo $RPATH|cut -d/ -f5`
        local CMD_WGET="http://$RHOST/$PATH_RAIZ/manut/limpar_cache.php?strTexto=clear_all -O /tmp/saida.txt -q"

        # echo "Limpando cache servidor: wget $CMD_WGET" >&2
        # wget $CMD_WGET
        # cat /tmp/saida.txt
        # echo "DESATIVADO"
    }

# END RSYNC MAIN FUCNTION //////////////////////////////////////////////////////////////////////////////////////





processa_repo() {
    data_sinc=`date "+%Y-%m-%d %H:%M"`
    echo "*****************************************************************************************************************************" >> $LOG_FILE
    echo "INÍCIO ATUALIZAÇÃO" >> $LOG_FILE
    echo "INICIANDO ATUALIZAÇÕES EM $data_sinc"
    echo "Sincronizando Fontes de Produção ... Aguarde" >> $LOG_FILE
    echo $data_sinc >> $LOG_FILE
    data_string="Data da atualização $data_sinc"
    echo $data_string  >> $LOG_FILE

    while [ $# -gt 0 ]
    do
        PROC_REPO="$1"
        shift

        case "$PROC_REPO" in

        # PROCESSA DEPLOY EPROCRS

        rs)

        
          date +"%Y-%m-%d_%Hh%Mm%Ss" > /dados/eclipse/workspace/eproc2_producao/manut/timestampRS.txt
	      echo "-----------------------------------------------------------------------------------------------------------------------------" >> $LOG_FILE
          echo "******** ATUALIZANDO FONTES RS! *************" >> $LOG_FILE
          echo "******** ATUALIZANDO FONTES RS! *************"

          echo "applic RS NOH1 - V2"
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  "$RUSER" "$RHOST_APPLICRS_NOH1" "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH1:$RPATH_WEBINFRA  >> $LOG_FILE

          
          echo "applic RS NOH2 -  V2"
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH2 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH2:$RPATH_WEBINFRA >> $LOG_FILE

          
          echo "applic RS NOH3 - V2"
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH3 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH3:$RPATH_WEBINFRA >> $LOG_FILE


           echo "applic RS NOH4 - V2"
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH4 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH4:$RPATH_WEBINFRA >> $LOG_FILE


          echo "applic RS NOH8 - V2"
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH8 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH8:$RPATH_WEBINFRA >> $LOG_FILE






          # WEB SERVICES APPs 

          echo "applic RS WS1 - V2"
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_WS1 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_WS1:$RPATH_WEBINFRA >> $LOG_FILE


          echo "applic RS WS2  - V2"
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_WS2 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_WS2:$RPATH_WEBINFRA >> $LOG_FILE


          echo "app ws para consulta publica portal"

          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_WS_CE "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_WS_CE:$RPATH_WEBINFRA >> $LOG_FILE


         
         echo "applic RS NOH9 - V2"
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH9 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH9:$RPATH_WEBINFRA >> $LOG_FILE


         echo "applic RS NOH10 - V2"
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH10 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH10:$RPATH_WEBINFRA >> $LOG_FILE


         echo "applic RS NOH11 - V2"
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH11 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
        $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH11:$RPATH_WEBINFRA >> $LOG_FILE


         

         echo "eproc-1g-aplic-noh12.jfrs.jus.br -noh clonado PR em 2015-02-06 - 10.2.30.150 "
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH12 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH12:$RPATH_WEBINFRA >> $LOG_FILE



         echo "eproc-1g-aplic-noh13.jfrs.jus.br -noh clonado PR em 2015-02-06 - 10.2.30.151 "
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH13 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH13:$RPATH_WEBINFRA >> $LOG_FILE

         echo "eproc-1g-aplic-noh14.jfrs.jus.br -noh clonado PR em 2015-02-06 - 10.2.30.152 "
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH14 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH14:$RPATH_WEBINFRA >> $LOG_FILE

         echo "eproc-1g-aplic-noh15.jfrs.jus.br -noh clonado PR em 2015-02-06 - 10.2.30.153 "
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH15 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH15:$RPATH_WEBINFRA >> $LOG_FILE


         # noh redhat 7.x e php 5.4.x

         echo "eproc-1g-aplic-noh16.jfrs.jus.br -noh clonado PR em 2015-02-06 - 10.2.30.201 "
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH16 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH16:$RPATH_WEBINFRA >> $LOG_FILE

         # noh redhat 7.x e php 5.6.x - 20151020
         echo "eproc-1g-aplic-noh17.jfrs.jus.br -noh clonado 20151020 - 10.2.30.201 "
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_NOH17 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_NOH17:$RPATH_WEBINFRA >> $LOG_FILE

         echo "applic RS eproc-down - V2 eproc-down.jfrs.jus.br 10.2.30.141"
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICRS_DOWN "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICRS_DOWN:$RPATH_WEBINFRA >> $LOG_FILE

         echo "applic RS eproc-down - V2 eproc-1g-crontab.jfrs.jus.br 10.2.30.135"
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_EPROCRS_CRONTAB "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_EPROCRS_CRONTAB:$RPATH_WEBINFRA >> $LOG_FILE

         echo "applic RS eproc-selocnj 10.2.30.155"
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_EPROCRS_SELOCNJ "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_EPROCRS_SELOCNJ:$RPATH_WEBINFRA >> $LOG_FILE

          echo "applic RS eproc-auto 10.2.30.160"
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_EPROCRS_AUTO "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_EPROCRS_AUTO:$RPATH_WEBINFRA >> $LOG_FILE

         # Server de consulta no trf4 RHOST_EPROC_CRONTAB
         echo "applic RS CONSULTA - SERVER NO TRF4 "

         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $HOST_APPLICRS_CONSULTA "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$HOST_APPLICRS_CONSULTA:$RPATH_WEBINFRA >> $LOG_FILE


         # SERVER APP RHOST_EPROCRS_APP android/ios

         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $HOST_APPLICRS_APP "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
         $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$HOST_APPLICRS_APP:$RPATH_WEBINFRA >> $LOG_FILE




        echo "******** ATUALIZANDO FONTES APRESENTAÇÃO 1 GRAU *************"
        echo "DESATIVADA TEMPORARIAMENTE"

        # erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" "$RUSER" "$RHOST_APRESENTACAO_1G" "$RPATH_APRESENTACAO_1G" "$LOG_FILE" "$GROUP"

        echo   "******** FIM **ATUALIZANDO FONTES RS! *************"




            ;;
        sc)

            date +"%Y-%m-%d_%Hh%Mm%Ss" > /dados/eclipse/workspace/eproc2_producao/manut/timestampSC.txt
	        echo "-----------------------------------------------------------------------------------------------------------------------------" >> $LOG_FILE
            echo "ATUALIZANDO FONTES SC!" >> $LOG_FILE

            echo "******** ATUALIZANDO FONTES SC! *************"



            echo "applic2 SC"     # Crontabs de estat
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC2 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC2:$RPATH_WEBINFRA  >> $LOG_FILE


	   	    echo "applic SC NOH1 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  "$RUSER" "$RHOST_APPLICSC_NOH1" "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_NOH1:$RPATH_WEBINFRA  >> $LOG_FILE

            echo "applic SC NOH2 -  V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_NOH2 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_NOH2:$RPATH_WEBINFRA >> $LOG_FILE

            echo "applic SC NOH3 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_NOH3 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_NOH3:$RPATH_WEBINFRA >> $LOG_FILE

            echo "applic SC NOH4 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_NOH4 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_NOH4:$RPATH_WEBINFRA >> $LOG_FILE


            echo "applic SC NOH5 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_NOH5 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_NOH5:$RPATH_WEBINFRA >> $LOG_FILE



            echo "applic SC SELO CNJ - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_SELOCNJ "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_SELOCNJ:$RPATH_WEBINFRA >> $LOG_FILE



            echo "applic SC CONSULTA - SERVER NO TRF4 "

            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $HOST_APPLICSC_CONSULTA "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$HOST_APPLICSC_CONSULTA:$RPATH_WEBINFRA >> $LOG_FILE


            echo  "applic SC NOH7 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_NOH7 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_NOH7:$RPATH_WEBINFRA >> $LOG_FILE



            echo "applic SC EPROC WS1 V2"

            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_WS1 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_WS1:$RPATH_WEBINFRA >> $LOG_FILE

	        echo "applic SC EPROC WS2 V2"

            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_WS2 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_WS2:$RPATH_WEBINFRA >> $LOG_FILE

            echo "applic SC EPROC DOWN V2"

            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_DOWN "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_DOWN:$RPATH_WEBINFRA >> $LOG_FILE

            echo "applic SC EPROC APP android/ios eproc-app.jfsc.jus.br 10.5.70.15 V2"

            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICSC_APP "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICSC_APP:$RPATH_WEBINFRA >> $LOG_FILE


            echo "******** FIM **ATUALIZANDO FONTES SC! *************"


	    ;;
        pr)


           date +"%Y-%m-%d_%Hh%Mm%Ss" > /dados/eclipse/workspace/eproc2_producao/manut/timestampPR.txt
	       echo "-----------------------------------------------------------------------------------------------------------------------------" >> $LOG_FILE

           echo "******** ATUALIZANDO FONTES PR! *************"

           echo "ATUALIZANDO FONTES PR!" >> $LOG_FILE



           echo "NOVOS SERVIDORES DE APLICAÇÃO PR - ATRÁS DO BALANCEADOR ";

          

           echo "applic PR NOH1 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  "$RUSER" "$RHOST_APPLICPR_NOH1" "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH1:$RPATH_WEBINFRA  >> $LOG_FILE

            # ----
           echo "applic  PR NOH2 -  V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_NOH2 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH2:$RPATH_WEBINFRA >> $LOG_FILE

           # ----
           echo "applic PR  NOH3 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_NOH3 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH3:$RPATH_WEBINFRA >> $LOG_FILE

           echo "applic PR  NOH4 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_NOH4 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH4:$RPATH_WEBINFRA >> $LOG_FILE

           # novos NÓS(5,6)  adicionados em 10/05/2012 - jct
           echo "applic PR  NOH5 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_NOH5 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH5:$RPATH_WEBINFRA >> $LOG_FILE

           echo "applic PR  NOH6 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_NOH6 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH6:$RPATH_WEBINFRA >> $LOG_FILE

 		   echo "applic PR  NOH7 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_NOH7 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH7:$RPATH_WEBINFRA >> $LOG_FILE

 		   echo "applic PR  NOH8 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_NOH8 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH8:$RPATH_WEBINFRA >> $LOG_FILE


           echo "applic PR  NOH9 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_NOH9 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH9:$RPATH_WEBINFRA >> $LOG_FILE

           echo "applic PR  NOH10 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_NOH10 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_NOH10:$RPATH_WEBINFRA >> $LOG_FILE



           echo "applic PR  SELOCNJ - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_SELOCNJ "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_SELOCNJ:$RPATH_WEBINFRA >> $LOG_FILE


           # ws - eproc-ws.jfpr.jus.br (1); eproc-ws2.jfpr.jus.br

           echo "applic PR  WS 1  - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_WS1 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_WS1:$RPATH_WEBINFRA >> $LOG_FILE


           echo "applic PR  WS 2 - V2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_WS2 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_WS2:$RPATH_WEBINFRA >> $LOG_FILE



           echo "applic PR  CONSULTA - SERVER NO TRF4 "

           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $HOST_APPLICPR_CONSULTA "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$HOST_APPLICPR_CONSULTA:$RPATH_WEBINFRA >> $LOG_FILE

           echo "applic PR  DOWNLOAD- eproc.jfpr.jus.br 10.7.123.30 "

           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_DOWN "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_DOWN:$RPATH_WEBINFRA >> $LOG_FILE

           echo "applic PR  CRON - eproc.jfpr.jus.br 10.7.123.29 "

           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_CRON "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_CRON:$RPATH_WEBINFRA >> $LOG_FILE

           echo "applic PR  APP  - eproc-app.jfpr.jus.br 10.7.123.70 "

           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICPR_APP "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICPR_APP:$RPATH_WEBINFRA >> $LOG_FILE

            ;;
        tnu)

            date +"%Y-%m-%d_%Hh%Mm%Ss" > /dados/eclipse/workspace/eproc2_producao/manut/timestampTNU.txt
            echo "-----------------------------------------------------------------------------------------------------------------------------" >> $LOG_FILE

            echo "******** ATUALIZANDO FONTES TNU! *************"

            echo "ATUALIZANDO FONTES TNU!" >> $LOG_FILE

            echo "NOVOS SERVIDORES DE APLICAÇÃO TNU - ATRÁS DO BALANCEADOR ";

            echo "applic TNU NOH1 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" $RUSER $RHOST_APPLICTNU_NOH1 "$NEW_RPATH_PRODUCAO_TNU" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTNU_NOH1:$RPATH_WEBINFRA  >> $LOG_FILE

            echo "applic TNU NOH2 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" $RUSER $RHOST_APPLICTNU_NOH2 "$NEW_RPATH_PRODUCAO_TNU" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTNU_NOH2:$RPATH_WEBINFRA  >> $LOG_FILE

            echo "applic TNU NOH3 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" $RUSER $RHOST_APPLICTNU_NOH3 "$NEW_RPATH_PRODUCAO_TNU" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTNU_NOH3:$RPATH_WEBINFRA  >> $LOG_FILE

            echo "applic TNU NOH4 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" $RUSER $RHOST_APPLICTNU_NOH4 "$NEW_RPATH_PRODUCAO_TNU" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTNU_NOH4:$RPATH_WEBINFRA  >> $LOG_FILE

            echo "applic TNU WS1 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" $RUSER $RHOST_APPLICTNU_WS1 "$NEW_RPATH_PRODUCAO_TNU" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTNU_WS1:$RPATH_WEBINFRA  >> $LOG_FILE

            echo "applic TNU DOWN - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" $RUSER $RHOST_APPLICTNU_DOWN "$NEW_RPATH_PRODUCAO_TNU" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTNU_DOWN:$RPATH_WEBINFRA  >> $LOG_FILE

            echo "applic TNU CRON - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" $RUSER $RHOST_APPLICTNU_CRON "$NEW_RPATH_PRODUCAO_TNU" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTNU_CRON:$RPATH_WEBINFRA  >> $LOG_FILE

            echo "applic TNU APP android/ios eproc-tnu-app.trf4.jus.br 10.1.30.124 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" $RUSER $RHOST_APPLICTNU_APP "$NEW_RPATH_PRODUCAO_TNU" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTNU_APP:$RPATH_WEBINFRA  >> $LOG_FILE



           ;;

        trf4)

            date +"%Y-%m-%d_%Hh%Mm%Ss" > /dados/eclipse/workspace/eproc2_producao/manut/timestampTRF4.txt

            echo "-----------------------------------------------------------------------------------------------------------------------------" >> $LOG_FILE
            echo "ATUALIZANDO FONTES TRF4!" >> $LOG_FILE

            echo "******** ATUALIZANDO FONTES TRF4! *************"

            echo "NOVOS SERVIDORES DE APLICAÇÃO EM TRF4 - ATRÁS DO BALANCEADOR ";


            #### trocando caminho da aplicação TRF4 #######

	   		NEW_RPATH_PRODUCAO_2=/var/www/html/eproc2trf4


            echo "applic TRF4 NOH1 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" $RUSER $RHOST_APPLICTRF4_NOH1 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_NOH1:$RPATH_WEBINFRA  >> $LOG_FILE

            # ----
            echo "applic TRF4  NOH2 -  V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_NOH2 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_NOH2:$RPATH_WEBINFRA >> $LOG_FILE

            # ----
            echo "applic TRF4  NOH3 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_NOH3 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_NOH3:$RPATH_WEBINFRA >> $LOG_FILE

            echo "applic TRF4  NOH4 - V2"
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_NOH4 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_NOH4:$RPATH_WEBINFRA >> $LOG_FILE

            # rhel 7.0 php 5.4.x
            echo "applic TRF4  NOH5 - V2 rhel 7.1 php 5.4.x "
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_NOH5 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_NOH5:$RPATH_WEBINFRA >> $LOG_FILE


            # rhel 7.1 php 5.6.x - jct em 20151020
            echo "applic TRF4  NOH6 - V2 rhel 7.1 php 5.6.x "
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_NOH6 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_NOH6:$RPATH_WEBINFRA >> $LOG_FILE



            # rhel 7.1 php 5.6.x - jct em 20160623
            echo "applic TRF4  NOH7 - V2 rhel 7.1 php 5.6.x "
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_NOH7 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_NOH7:$RPATH_WEBINFRA >> $LOG_FILE

            # rhel 7.1 php 5.6.x - sjrsrls em 20170419
            echo "applic TRF4  NOH8 - V2 rhel 7.1 php 5.6.x "
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_NOH8 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_NOH8:$RPATH_WEBINFRA >> $LOG_FILE

            # rhel 7.1 php 5.6.x - sjrsrls em 20170419
            echo "applic TRF4  NOH9 - V2 rhel 7.1 php 5.6.x "
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_NOH9 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_NOH9:$RPATH_WEBINFRA >> $LOG_FILE

            # rhel 7.1 php 5.6.x - jbs em 20160726
            echo "applic TRF4  SELO CNJ - V2 rhel 7.1 php 5.6.x "
            erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_SELO "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
            $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_SELO:$RPATH_WEBINFRA >> $LOG_FILE


          echo "applic TRF4  DOWN"
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_DOWN "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
          $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_DOWN:$RPATH_WEBINFRA >> $LOG_FILE


           echo "applic TRF4  WS"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_WS "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_WS:$RPATH_WEBINFRA >> $LOG_FILE


           # jct -  adicionado em 11/01/2012
           echo "applic TRF4  WS2"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_WS2 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_WS2:$RPATH_WEBINFRA >> $LOG_FILE

          # tff -  adicionado em 08/04/2016
           echo "applic TRF4  WS3"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_WS3 "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_WS3:$RPATH_WEBINFRA >> $LOG_FILE

		   echo "applic TRF4  WS CONSULTA"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_WS_CONSULTA "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_WS_CONSULTA:$RPATH_WEBINFRA >> $LOG_FILE

           echo "applic TRF4  eproc-down.trf4.jus.br - 10.1.30.115"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_DOWN "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_DOWN:$RPATH_WEBINFRA >> $LOG_FILE


           echo "applic TRF4 app android/ios  eproc-app.trf4.jus.br - 10.1.30.123"
           erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_APP "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" $GROUP
           $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_APP:$RPATH_WEBINFRA >> $LOG_FILE




           echo "******** ATUALIZANDO FONTES APRESENTAÇÃO 2 GRAU *************"
	       echo "******** DESATIVADA TEMPORARIAMENTE *************************"

#          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" "$RUSER" "$RHOST_APRESENTACAO_2G" "$RPATH_APRESENTACAO_2G" "$LOG_FILE" "$GROUP"



           NEW_RPATH_PRODUCAO_2=/var/www/html/eprocV2


            ;;

       apresentacao)

         # apresentacao 1 GRAU

         echo "******** ATUALIZANDO FONTES APRESENTAÇÃO 1 GRAU ************* (DESABILITADO)"
         #erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" "$SUPERUSER" "$RHOST_APRESENTACAO_1G" "$RPATH_APRESENTACAO_1G" "$LOG_FILE" "$GROUP"
         #$RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $SUPERUSER@$RHOST_APRESENTACAO_1G:$RPATH_WEBINFRA >> $LOG_FILE

         # apresentacao 2 GRAU

         echo "******** ATUALIZANDO FONTES APRESENTAÇÃO 2 GRAU ************* (DESABILITADO)"
         #erressinque "$LOGFILERSYNC" "$KEY" "$LPATH" "$SUPERUSER" "$RHOST_APRESENTACAO_2G" "$RPATH_APRESENTACAO_2G" "$LOG_FILE" "$GROUP"
         #$RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $SUPERUSER@$RHOST_APRESENTACAO_2G:$RPATH_WEBINFRA >> $LOG_FILE

         ;;

      homologa)

        echo "ATUALIZANDO ARQUIVO DE CONFIG DE HOMOLOGAÇÃO DO TRF4 - 2º GRAU"
        yes|cp -pf $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php.homologa2g $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php

        echo "ATUALIZANDO FONTES DE HOMOLOGAÇÃO DO TRF4 - 2º GRAU"
        erressinque "$LOGFILERSYNC" "$KEY" "$LPATH_HOMOLOGA" $RUSER $RHOST_EPROCTRF4_HOMOLOGACAO "$RPATH_EPROCTRF4_HOMOLOGACAO" "$LOG_FILE"

        echo "ATUALIZANDO ARQUIVO DE CONFIG DE HOMOLOGAÇÃO DA TNU"
        yes|cp -pf $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php.homologatnu $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php

        echo "ATUALIZANDO FONTES DE HOMOLOGAÇÃO - TNU"
        RHOST_EPROC_1G_HML_APLIC2_TNU="10.1.30.149"
        RPATH_EPROC_1G_HML_APLIC=/opt/eprocv2/homologa_tnu
        erressinque "$LOGFILERSYNC" "$KEY" "$LPATH_HOMOLOGA" $RUSER $RHOST_EPROC_1G_HML_APLIC2_TNU "$RPATH_EPROC_1G_HML_APLIC" "$LOG_FILE"


        echo "ATUALIZANDO ARQUIVO DE CONFIG 1º GRAU RS - NOH01 "
        yes|cp -pf $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php.homologa1grs $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php

        echo "ATUALIZANDO FONTES DE HOMOLOGAÇÃO -  1º GRAU RS - NOH01 "
        RHOST_EPROC_1G_HML_APLIC2_RS="10.1.30.155"
        RPATH_EPROC_1G_HML_APLIC=/opt/eprocv2/homologa_1g

        erressinque "$LOGFILERSYNC" "$KEY" "$LPATH_HOMOLOGA" $RUSER $RHOST_EPROC_1G_HML_APLIC2_RS "$RPATH_EPROC_1G_HML_APLIC" "$LOG_FILE"



        echo "ATUALIZANDO ARQUIVO DE CONFIG 1º GRAU RS - NOH02 "
        yes|cp -pf $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php.homologa1grs $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php

		echo "ATUALIZANDO FONTES DE HOMOLOGAÇÃO -  1º GRAU RS - NOH02 "
        RHOST_EPROC_1G_HML_APLIC3_RS="10.1.30.156"
        RPATH_EPROC_1G_HML_APLIC=/opt/eprocv2/homologa_1g

        erressinque "$LOGFILERSYNC" "$KEY" "$LPATH_HOMOLOGA" $RUSER $RHOST_EPROC_1G_HML_APLIC3_RS "$RPATH_EPROC_1G_HML_APLIC" "$LOG_FILE"


        RHOST_EPROC_1G_HML_APLIC1_SC=10.1.30.154
        RPATH_EPROC_HOMOMOLOGA_SC="/opt/eprocv2/homologa_1g"

        echo "ATUALIZANDO ARQUIVO DE CONFIG 1º GRAU RS - NOH01 "
        yes|cp -pf $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php.homologa1gsc $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php

         echo "ATUALIZANDO FONTES DE HOMOLOGAÇÃO -  1º GRAU SC "
         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH_HOMOLOGA" $RUSER "$RHOST_EPROC_1G_HML_APLIC1_SC" "$RPATH_EPROC_HOMOMOLOGA_SC" "$LOG_FILE"


        echo "ATUALIZANDO ARQUIVO DE CONFIG  1º GRAU PR "
        yes|cp -pf $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php.homologa1gpr $LPATH_HOMOLOGA/config/ConfiguracaoEproc.php

        echo "ATUALIZANDO FONTES DE HOMOLOGAÇÃO -  1º GRAU PR "

        RHOST_EPROC_1G_HML_APLIC1_PR=10.1.30.157
        RPATH_EPROC_HOMOMOLOGA_PR="/opt/eprocv2/homologa_1g"

         erressinque "$LOGFILERSYNC" "$KEY" "$LPATH_HOMOLOGA" $RUSER "$RHOST_EPROC_1G_HML_APLIC1_PR" "$RPATH_EPROC_HOMOMOLOGA_PR" "$LOG_FILE"
         # $RSYNC -Cravzp --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_EPROC_1G_HML_APLIC1_PR:$RPATH_WEBINFRA >> $LOG_FILE


 ;;
     teste)

        echo "ATUALIZANDO FONTES DE TESTES -  1º/2º GRAUS "


        RHOST_EPROC_1G_TST=10.1.30.42
        RPATH_EPROC_1G_TST="/var/www/html/teste_1g"
        erressinque "$LOGFILERSYNC" "$KEY" "$LPATH_HOMOLOGA" $RUSER "$RHOST_EPROC_1G_TST" "$RPATH_EPROC_1G_TST" "$LOG_FILE"
        # WebInfra mapeada para infra de desenv

        RHOST_EPROC_2G_TST=10.1.30.41
        RPATH_EPROC_2G_TST="/var/www/html/teste_2g"
        erressinque "$LOGFILERSYNC" "$KEY" "$LPATH_HOMOLOGA" $RUSER "$RHOST_EPROC_2G_TST" "$RPATH_EPROC_2G_TST" "$LOG_FILE"
        # WebInfra mapeada para infra de desenv

      ;;

      permissao)

          NEW_RPATH_PRODUCAO_2=/var/www/html/eproc2trf4
          echo "TESTANDO PERMISSÕES  "
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH"  $RUSER $RHOST_APPLICTRF4_PERM "$NEW_RPATH_PRODUCAO_2" "$LOG_FILE" "$GROUP"
          #$RSYNC -rlptgoD  --log-file=$LOGFILERSYNC -e "$SSH -i $KEY" $LPATH_WEBINFRA  $RUSER@$RHOST_APPLICTRF4_PERM:$RPATH_WEBINFRA >> $LOG_FILE
          erressinque "$LOGFILERSYNC" "$KEY" "$LPATH_WEBINFRA"  $RUSER  $RHOST_APPLICTRF4_PERM "$RPATH_WEBINFRA" "$LOG_FILE" "$GROUP"

       ;;

        esac
    done
    echo "FIM ATUALIZAÇÃO!" >> $LOG_FILE
    echo "FIM ATUALIZAÇÕES!"
    echo "********************************************************************************************************************************" >> $LOG_FILE
}


# USAGE ///////////////////////////////////////////////////////////////////////////////////////////////////////


lista_usage() {
    /bin/cat <<_USAGE_EOF_
Usage:
    $0 { -a | -l | -r REPOSITORIO }... -o { file | all } [ -n ]

    -l = lista repositorios
    -a = processa todos os repositorios
    -r = processa somente REPOSITORIO

    -o file = processa somente arquivos listados em $FILELIST
    -o all  = processa todos arquivos atualizados pelo controle de versao

    -n NAO EXECUTA RSYNC, APENAS SIMULA (dry-run, parametro -n do rsync)
       PS: Demais comandos remotos serao executados (chmod, webinfra update, etc. ver fonte de $0)
_USAGE_EOF_

}


# END USAGE



MODOTRANSF='' # modo de transferencia opcao "-o"

MODOREPO=''   # todos os repositoris (-a) ou determinado (-r)

REPOS_R=''  # quais repositorios processar (-r REPOSITORIO)

while getopts "alno:r:" OPCAO
do
    case "$OPCAO" in
    l)
        lista_repositorios
        exit
        ;;
    r)
        if [ ! -z "$MODOREPO" ]; then
            if [ "$MODOREPO" != "$OPCAO" ]; then
		echo "Opcoes antagonicas selecionadas: ($MODOREPO) X ($OPCAO)" >&2
		lista_usage
		exit 3
	    fi
	fi
        MODOREPO='r'
        REPOPARAM=''
        for REPO in ${REPOSITORIO[*]}
        do
            if [ $REPO = "$OPTARG" ]; then
                REPOPARAM="$OPTARG"
                break
            fi
        done

        if [ -z "$REPOPARAM" ]; then
            echo "Repositorio nao identificado: -r ($OPTARG)" >&2
            echo "Usar opcao $0 -l" >&2
            exit 3
        fi

        REPOS_R="${REPOS_R} ${REPOPARAM}" # lista de repositorios
        ;;
    a)
        if [ ! -z "$MODOREPO" ]; then
            if [ "$MODOREPO" != "$OPCAO" ]; then
		echo "Opcoes antagonicas selecionadas: ($MODOREPO) X ($OPCAO)" >&2
		lista_usage
		exit 3
	    fi
	fi
        MODOREPO='a'
        ;;
    n)
        echo "Modo SIMULACAO (-$OPCAO): acompanhe o log com o comando:"
        echo ""
        echo "######################################################"
        echo ""
        sleep 1
        echo "   tail -f \"$LOG_FILE\""
        sleep 1
        echo ""
        echo "######################################################"
        echo ""
        sleep 2
        MODODRYRUN='-n --list-only'
        ;;
    o)
        case "$OPTARG" in
            file|all)
		      if [ ! -z "$MODOTRANSF" ]; then
			  if [ "$MODOTRANSF" != "$OPTARG" ]; then
			      echo "Opcoes antagonicas selecionadas: ($MODOTRANSF) X ($OPTARG)" >&2
                              lista_usage
			      exit 3
			  fi
		      fi
                      MODOTRANSF="$OPTARG"
                      ;;
            *)
                      echo "Parametro -o invalido: ($OPTARG) dever ser 'file' ou 'all'" >&2
                      lista_usage
                      exit 3
                      ;;
        esac
        ;;
    *)
        lista_usage
        exit 3
        ;;
    esac
done



if [ -z "$MODOTRANSF" ]; then
    echo "Parametro -o deve ser fornecido" >&2
    lista_usage
    exit 3
fi

case "$MODOREPO" in
    r)
        for REPO in $REPOS_R
        do
            echo "processar repositorio: $REPO"
            processa_repo $REPO
        done
        ;;
    a)
	cat <<_ACORDA_AE_
+++++++++++++++++++++++
ATENCAO!!!

Voce escolheu a opcao "-a"

Isto ira processar todos os repositorios!

Tem certeza que deseja isto?

   Sim = processar todos os repositorios

   Nao = nao faz nada

Entre com sua opcao (case sensitive):
_ACORDA_AE_
        read RESP
	if [ "$RESP" != 'Sim' ]; then
	  echo "Abortando... nada foi processado, descanse em paz!"
	  exit
	fi
        for REPO in ${REPOSITORIO[*]}
        do
            echo "processar repositorio: $REPO"
            processa_repo $REPO
        done
        ;;
    *)
        echo "Parametro -a ou -r deve ser fornecido" >&2
        lista_usage
        exit 3
        ;;
esac

