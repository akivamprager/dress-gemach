using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for db
/// </summary>
public class db
{
    public static string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True;Connect Timeout=30";
    public db()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static int exec(string sql)
    {
        int rowsAffected;
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(sql, connection);
        connection.Open();
        rowsAffected = command.ExecuteNonQuery(); 
        connection.Close();
        return rowsAffected;
    }
    public static int execID(string sql)
    {
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand command = new SqlCommand(sql, connection);
        connection.Open();
        int id = Convert.ToInt32(command.ExecuteScalar());
        connection.Close();
        return id;
    }
    //returns DataSet from DB for given SQL command string
    public static DataSet vieww(string sql)
    {
        DataSet ds = new DataSet();
        string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True;Connect Timeout=30";
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sql;
        cmd.Connection = connection;
        connection.Open();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        adapter.Fill(ds);
        return ds;
    }

    public static DataTable viewt(string sql)
    {
        DataSet ds = new DataSet();
        string connectionString = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=|DataDirectory|\GemachDB.mdf;Integrated Security=True;Connect Timeout=30";
        SqlConnection connection = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sql;
        cmd.Connection = connection;
        connection.Open();
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        adapter.Fill(ds);
        return (ds.Tables[0]);
    }
}