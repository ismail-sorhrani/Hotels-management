package entities;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Ville implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String nom;
	public Ville() {
		super();
	}
	
	
	public Ville(int id,String nom) {
		super();
		this.nom = nom;
		this.id=id;
	}
	public Ville(String nom) {
		super();
		this.nom = nom;
		
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}


	@Override
	public String toString() {
		return "Ville [id=" + id + ", nom=" + nom + "]";
	}
	
	
	
}
