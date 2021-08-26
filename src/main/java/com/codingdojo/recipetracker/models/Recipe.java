package com.codingdojo.recipetracker.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="recipes")
public class Recipe {
	 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NotEmpty(message="Please enter the recipe name")
    private String name;
    @NotEmpty(message="Please enter the recipe description")
    private String description;
    private String extraComments;
    private String picture;
    @NotNull(message="Please select Yes or No")
    private Boolean under30;
    @NotNull(message="Please enter prep time in minuets")
    private Integer prepTime;
    @NotNull(message="Please enter cook time in minuets")
    private Integer cookTime;
    private String category;
    private String dietRequirement;

    private String steps;
    
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "recipeLikes", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> userLikes;
    
    
    @OneToMany(mappedBy="recipe", fetch = FetchType.LAZY)
    private List<Ingredient> ingredients;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User creator;   
    
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
    
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    
    
    public Recipe() {}
     
    
	
	

	public Recipe(Long id, @NotEmpty(message = "Please enter the recipe name") String name,
			@NotEmpty(message = "Please enter the recipe description") String description, String extraComments,
			String picture, @NotNull(message = "Please select Yes or No") Boolean under30,
			@NotNull(message = "Please enter prep time in minuets") Integer prepTime,
			@NotNull(message = "Please enter cook time in minuets") Integer cookTime, String category,
			String dietRequirement, String steps, List<User> userLikes, List<Ingredient> ingredients, User creator,
			Date createdAt, Date updatedAt) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.extraComments = extraComments;
		this.picture = picture;
		this.under30 = under30;
		this.prepTime = prepTime;
		this.cookTime = cookTime;
		this.category = category;
		this.dietRequirement = dietRequirement;
		this.steps = steps;
		this.userLikes = userLikes;
		this.ingredients = ingredients;
		this.creator = creator;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	public Long getId() {
		return id;
	}





	public void setId(Long id) {
		this.id = id;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}





	public String getDescription() {
		return description;
	}





	public void setDescription(String description) {
		this.description = description;
	}





	public String getExtraComments() {
		return extraComments;
	}





	public void setExtraComments(String extraComments) {
		this.extraComments = extraComments;
	}





	public String getPicture() {
		return picture;
	}





	public List<Ingredient> getIngredients() {
		return ingredients;
	}
	public void setIngredients(List<Ingredient> ingredients) {
		this.ingredients = ingredients;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}





	public Boolean getUnder30() {
		return under30;
	}





	public void setUnder30(Boolean under30) {
		this.under30 = under30;
	}





	public Integer getPrepTime() {
		return prepTime;
	}





	public void setPrepTime(Integer prepTime) {
		this.prepTime = prepTime;
	}





	public Integer getCookTime() {
		return cookTime;
	}





	public void setCookTime(Integer cookTime) {
		this.cookTime = cookTime;
	}


	
	


	public List<User> getUserLikes() {
		return userLikes;
	}
	public void setUserLikes(List<User> userLikes) {
		this.userLikes = userLikes;
	}
	public String getCategory() {
		return category;
	}





	public void setCategory(String category) {
		this.category = category;
	}





	public String getDietRequirement() {
		return dietRequirement;
	}





	public void setDietRequirement(String dietRequirement) {
		this.dietRequirement = dietRequirement;
	}



	


	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public Date getCreatedAt() {
		return createdAt;
	}





	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}





	public Date getUpdatedAt() {
		return updatedAt;
	}





	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getSteps() {
		return steps;
	}
	public void setSteps(String steps) {
		this.steps = steps;
	}
	
	
	
	
	

		


}
