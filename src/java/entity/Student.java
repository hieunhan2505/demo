package entity;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="Students")
public class Student {
	@Id 
	@GeneratedValue
	private Integer id;
 
    public Student() {
    }
	private String fullname;
	private Boolean gender;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/d/yyyy")
	private Date birthday;
	private Double mark;
        private String email;
        private String photo;
        private String username;
        private String password;
        private Double thanhtich;
        private Double kyluat;
        @Temporal(TemporalType.DATE)
        @DateTimeFormat(pattern="yyyy/MM/dd")
       
        private Date ngaydanhgia;

    public Date getNgaydanhgia() {
        return ngaydanhgia;
    }

    public void setNgaydanhgia(Date ngaydanhgia) {
        this.ngaydanhgia = ngaydanhgia;
    }
    public Double getThanhtich() {
        return thanhtich;
    }

    public void setThanhtich(Double thanhtich) {
        this.thanhtich = thanhtich;
    }

    public Double getKyluat() {
        return kyluat;
    }

    public void setKyluat(Double kyluat) {
        this.kyluat = kyluat;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Student(Integer id, Double mark) {
        this.id = id;
        this.mark = mark;
    }

 



   
   

	@ManyToOne
	@JoinColumn(name="majorId")
	private Major major;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Boolean getGender() {
		return gender;
	}

	public void setGender(Boolean gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Double getMark() {
		return mark;
	}

	public void setMark(Double mark) {
		this.mark = mark;
	}

	public Major getMajor() {
		return major;
	}

	public void setMajor(Major major) {
		this.major = major;
	}
}
