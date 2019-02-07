using Email.nttappsweb0006;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;

namespace Email
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var cema = new CemaWebService();

              var respuesta=  cema.SendEmail(ePrioridad.Baja,
                    "asunto",
                    "cuerpo",
                    "",
                    "Desarrollo_Saydot_Ordenes@claro.com.do",
                    "adelson_sanchez@claro.com.do,adelsanchez67@yahoo.es",
                    "",
                    "AP42",
                    DateTime.Now.AddDays(2),
                    Encoding.ASCII.GetBytes(Environment.CurrentDirectory + @"\resultado.xls"),
                    "resultado.xls"
                    );

                Console.WriteLine(respuesta.Codigo + " " + respuesta.Respuesta);
                Console.Read();

                 //leo el contenido del archivo que contiene el query
                 var query = new StreamReader(Environment.CurrentDirectory+@"\query.txt").ReadToEnd();

                DatatableToExcel
                (
                    QueryToDatatable
                    (
                        Properties.Settings.Default.ConnectionString,
                        query
                    ),
                    Environment.CurrentDirectory + @"\resultado.xls"
                 );

                SendXlsToEmail
                (
                    Properties.Settings.Default.Emails,
                    "Ordenes Pendientes del dia " + DateTime.Now.AddDays(-1).ToString("dd/MM/yyyy hh:mm:ss"),                    
                    "Saludos, Adjunto archivo con ordenes pendiente sin cerrar del dia de ayer",
                    Environment.CurrentDirectory + @"\resultado.xls"
                );


            }
            catch (Exception e)
            {
                SendXlsToEmail("adelson_sanchez@claro.com.do", "sistema que envia ordenes por correo (Email.exe)", "Se ha producido una exception al intentar generar el reporte :" +
                    Environment.NewLine+
                    Environment.NewLine + "Error: "+e.Message +
                    Environment.NewLine + "Method: " + e.TargetSite );
            }


        }


        //las variables configurables, las manejo en el archivo app.config

        //le pasa una consulta y la conexion y te devuelve un datatable lleno.
        static DataTable QueryToDatatable(string connectionString, string query)
        {
            DataTable dataTable = new DataTable();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand sqlCommand = new SqlCommand(query, connection))
                {
                    dataTable.Load(sqlCommand.ExecuteReader());
                }
            }

            return dataTable;
        }


        /// <summary>
        /// le pasa un datatable lleno y te guarda un archivo de excel en la ruta
        /// donde se encuentre el .exe
        /// </summary>
        /// <param name="dataTable"></param>
        /// <param name="ExcelPath">ruta completa incluyendo nombre y extension, donde se guardará el archivo excel</param>
        static void DatatableToExcel(DataTable dataTable, string ExcelPath)
        {
            const string FIELDSEPARATOR = "\t";
            const string ROWSEPARATOR = "\n";
            StringBuilder output = new StringBuilder();
            // Escribir encabezados    
            foreach (DataColumn dc in dataTable.Columns)
            {
                output.Append(dc.ColumnName);
                output.Append(FIELDSEPARATOR);
            }
            output.Append(ROWSEPARATOR);
            foreach (DataRow item in dataTable.Rows)
            {
                foreach (object value in item.ItemArray)
                {
                    output.Append(value.ToString().Replace('\n', ' ').Replace('\r', ' ').Replace('.', ','));
                    output.Append(FIELDSEPARATOR);
                }
                // Escribir una línea de registro        
                output.Append(ROWSEPARATOR);
            }
            // Valor de retorno  
            StreamWriter sw = new StreamWriter(ExcelPath);
            sw.Write(output.ToString());
            sw.Close();
        }



        /// <summary>
        /// Envia correo a los emails especificado.
        /// </summary>
        /// <param name="Emails">separados por coma</param>
        /// <param name="subject">asundo del correo</param>
        /// <param name="body">cuerpo del correo</param>
        /// <param name="attachments">ruta completa con nombre y extension, del archivo a enviar</param>
        /// <param name="isBodyHtml">true o false indica si el body sera una tabla html</param>
        static void SendXlsToEmail(string Emails, string subject, string body, string attachments = null)
        {
            MailMessage mail = new MailMessage();

            //datos del servidor de correo saliente
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "smtp.mail.yahoo.com";
            smtpClient.Port = 587;
            smtpClient.EnableSsl = true;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new System.Net.NetworkCredential("SaydotOrdenes@yahoo.com", "@123456789");

            //datos del correo
            mail = new MailMessage();
            //SaydotOrdenes@yahoo.com
            mail.From = new MailAddress("SaydotOrdenes@yahoo.com", "", System.Text.Encoding.UTF8);
            mail.To.Add(Emails);
            mail.Subject = subject;
            if (attachments != null) mail.Attachments.Add(new Attachment(attachments));           
            mail.Body = body;
            smtpClient.Send(mail);
        }

    }
}
