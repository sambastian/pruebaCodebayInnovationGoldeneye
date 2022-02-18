package com.codebay.goldeneye;

public enum DepartmentEnum {
	Design("Design"), Business("Business"), Advertising("Advertising"), ResearchAndDeveloment("Research and develoment");

	private String description;

	DepartmentEnum(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	@Override
	public String toString() {
		return name().toLowerCase();
	}

}
