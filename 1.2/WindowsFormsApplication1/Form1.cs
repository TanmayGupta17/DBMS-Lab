using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApplication1
{
    public partial class Form1 : Form
    {
        private string var;
        private String gender;
        private String sub;
        private String std;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked)
            {
                this.sub += "Physics";
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            var = textBox1.Text;
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {
            this.var = monthCalendar1.SelectionRange.Start.ToShortDateString();
        }

        private void radioButton2_CheckedChanged_1(object sender, EventArgs e)
        {
            this.gender = "Male";
        }

        private void radioButton1_CheckedChanged_1(object sender, EventArgs e)
        {
            this.gender = "Female";
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if(checkBox1.Checked){
                this.sub += "Maths";
            }
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox3.Checked)
            {
                this.sub += "Chemistry";
            }
        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox4.Checked)
            {
                this.sub += "Biology";
            }
        }

        private void checkBox5_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox5.Checked)
            {
                this.sub += "Physical Education";
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.std = comboBox1.Text;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String str;
            str = var + "\n" + gender + "\n" + std + "Selected Subjects" + sub;
            MessageBox.Show(str);
        }
    }
}
