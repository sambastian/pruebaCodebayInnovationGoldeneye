package com.codebay.goldeneye;

public enum OfficeLocationEnum {
	Milan("Milan", new DepartmentEnum[] { DepartmentEnum.Design, DepartmentEnum.Business, DepartmentEnum.Advertising }),
	Spain("Spain", new DepartmentEnum[] { DepartmentEnum.ResearchAndDeveloment, DepartmentEnum.Business }),
	NewYork("New York", new DepartmentEnum[] { DepartmentEnum.Business, DepartmentEnum.Advertising });

	private String description;
	private DepartmentEnum[] departments;

	OfficeLocationEnum(String description, DepartmentEnum[] departments) {
		this.description = description;
		this.departments = departments;
	}

	public String getDescription() {
		return description;
	}

	public DepartmentEnum[] getDepartments() {
		return departments;
	}

	@Override
	public String toString() {
		return name().toLowerCase();
	}

}
