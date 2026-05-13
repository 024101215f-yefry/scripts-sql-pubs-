using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace proyecto1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnPublishers_Click(object sender, EventArgs e)
        {
            // Opercacion binaria UNION 
            using (pubsEntities pubs = new pubsEntities())
            {
                // Publicacionesd de USA
                var consulta1 = from P in pubs.publishers
                                where P.country == "USA"
                                select new
                                {
                                    P.pub_id,
                                    P.pub_name,
                                    P.city,
                                    P.country
                                };
                //Publicaciones para alemania 
                var consulta2 = from P in pubs.publishers
                                where P.country == "Germany"
                                select new
                                {
                                    P.pub_id,
                                    P.pub_name,
                                    P.city,
                                    P.country
                                };
                var consulta = consulta1.Union(consulta2);
                dgvPubs.DataSource = consulta.ToList();
            }
        }

        private void btntitles_Click(object sender, EventArgs e)
        {
            // Union con 2 relaciones  
            using (pubsEntities pubs = new pubsEntities())
            {

                var consulta1 = from T in pubs.titles
                                where T.type == "business"
                                select new
                                {
                                    T.type,
                                    T.title1,
                                    T.advance,
                                    T.notes
                                };

                var consulta2 = from T in pubs.titles
                                where T.type == "psychology"
                                select new
                                {
                                    T.type,
                                    T.title1,
                                    T.advance,
                                    T.notes
                                };
                var consulta = consulta1.Union(consulta2);
                dgvPubs.DataSource = consulta.ToList();
            }
        }

        private void btnauthors_Click(object sender, EventArgs e)
        {
            // Opercacion  de 3 relaicones  
            using (pubsEntities pubs = new pubsEntities())
            {

                var consulta1 = from A in pubs.authors
                                where A.state == "CA"
                                select new
                                {
                                    A.au_id,
                                    A.state,
                                    A.phone,
                                    A.city
                                };

                var consulta2 = from A in pubs.authors
                                where A.state == "UT"
                                select new
                                {
                                    A.au_id,
                                    A.state,
                                    A.phone,
                                    A.city
                                };

                var consulta3 = from A in pubs.authors
                                where A.state == "KS"
                                select new
                                {
                                    A.au_id,
                                    A.state,
                                    A.phone,
                                    A.city
                                };


                var consultaFinal = consulta1.Union(consulta2).Union(consulta3);

                dgvPubs.DataSource = consultaFinal.ToList();
            }
        }

        private void btnstores_Click(object sender, EventArgs e)
        {
            // Union con 4 relaciones 
            using (pubsEntities pubs = new pubsEntities())
            {
                var consulta1 = from S in pubs.stores
                                where S.state == "CA"
                                select new
                                {
                                    S.stor_id,
                                    S.stor_name,
                                    S.city,
                                    S.state
                                };

                var consulta2 = from S in pubs.stores
                                where S.state == "WA"
                                select new
                                {
                                    S.stor_id,
                                    S.stor_name,
                                    S.city,
                                    S.state
                                };

                var consulta3 = from S in pubs.stores
                                where S.state == "OR"
                                select new
                                {
                                    S.stor_id,
                                    S.stor_name,
                                    S.city,
                                    S.state
                                };

                var consulta4 = from S in pubs.stores
                                where S.stor_name.Contains("Barnum")
                                select new
                                {
                                    S.stor_id,
                                    S.stor_name,
                                    S.city,
                                    S.state
                                };

                var consultaFinal = consulta1.Union(consulta2)
                             .Union(consulta3)
                             .Union(consulta4);

                dgvPubs.DataSource = consultaFinal.ToList();
            }
        }

        private void btnsales_Click(object sender, EventArgs e)
        {
            // Interseccion 1
            using (pubsEntities pubs = new pubsEntities())
            {
                var consulta1 = from S in pubs.sales
                                where S.qty > 10
                                select new
                                {
                                    S.stor_id,
                                    S.ord_num,
                                    S.title_id
                                };

               
                var consulta2 = from S in pubs.sales
                                where S.stor_id == "7066"
                                select new
                                {
                                    S.stor_id,
                                    S.ord_num,
                                    S.title_id
                                };


                var resultadoFinal = consulta1.Intersect(consulta2);

                dgvPubs.DataSource = resultadoFinal.ToList();
            }
        }

        private void btnemployee_Click(object sender, EventArgs e)
        {
            // Interseccion 2
            using (pubsEntities pubs = new pubsEntities())
            {
                var consulta1 = from E in pubs.employees
                                where E.job_lvl > 100
                                select new
                                {
                                    Nombre = E.fname,
                                    Apellido = E.lname,
                                    Editorial = E.pub_id
                                };

                var consulta2 = from E in pubs.employees
                                where E.pub_id == "0877"
                                select new
                                {
                                    Nombre = E.fname,
                                    Apellido = E.lname,
                                    Editorial = E.pub_id
                                };

                
                var resultadoFinal = consulta1.Intersect(consulta2);

                dgvPubs.DataSource = resultadoFinal.ToList();
            }
        }
    }
}



