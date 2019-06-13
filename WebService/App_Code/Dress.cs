using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Dress
/// </summary>

[Serializable]
public class Dress
{
    private int id_dress;
    private string size;
    private string length;
    private string additional_info;
    private DateTime date_published;

	public Dress()
	{}
    public Dress(int id_dress, string size, string length, string additional_info, DateTime date_published)
    {
        this.id_dress = id_dress;
        this.size = size;
        this.length = length;
        this.additional_info = additional_info;
        this.date_published = date_published;
    }
    public String ToStringMod()
    {
        return "ID: " + id_dress + "\n"
            + "Size: " + size + "\n"
            + "Length: " + length + "\n"
            + "Additional Info: " + additional_info + "\n"
            + "Date Published: " + date_published;
    }
}