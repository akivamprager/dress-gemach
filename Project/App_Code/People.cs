public class People
{
    private int id_person;
    private bool is_admin;
    private string username;
    private string password;
    private string full_name;
    private string address;
    private string phone;
    private string dress_size;
    private string dress_length;
    public People()
    {
    }
    public int Id_person
    {
        get
        {
            return id_person;
        }
        set
        {
            this.id_person = value;
        }
    }
    public bool Is_admin
    {
        get
        {
            return is_admin;
        }
        set
        {
            this.is_admin = value;
        }
    }
    public string Username
    {
        get
        {
            return username;
        }
        set
        {
            this.username = value;
        }
    }
    public string Password
    {
        get
        {
            return password;
        }
        set
        {
            this.password = value;
        }
    }
    public string Full_name
    {
        get
        {
            return full_name;
        }
        set
        {
            this.full_name = value;
        }
    }
    public string Address
    {
        get
        {
            return address;
        }
        set
        {
            this.address = value;
        }
    }
    public string Phone
    {
        get
        {
            return phone;
        }
        set
        {
            this.phone = value;
        }
    }
    public string Dress_size
    {
        get
        {
            return dress_size;
        }
        set
        {
            this.dress_size = value;
        }
    }
    public string Dress_length
    {
        get
        {
            return dress_length;
        }
        set
        {
            this.dress_length = value;
        }
    }
    public People a(int idUser)
    {
        People u = new People();
        return u;
    }
}