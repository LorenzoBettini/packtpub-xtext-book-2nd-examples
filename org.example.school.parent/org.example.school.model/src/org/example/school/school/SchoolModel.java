/**
 */
package org.example.school.school;

import org.eclipse.emf.common.util.EList;

import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Model</b></em>'.
 * <!-- end-user-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link org.example.school.school.SchoolModel#getSchools <em>Schools</em>}</li>
 * </ul>
 *
 * @see org.example.school.school.SchoolPackage#getSchoolModel()
 * @model
 * @generated
 */
public interface SchoolModel extends EObject {
	/**
	 * Returns the value of the '<em><b>Schools</b></em>' containment reference list.
	 * The list contents are of type {@link org.example.school.school.School}.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Schools</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Schools</em>' containment reference list.
	 * @see org.example.school.school.SchoolPackage#getSchoolModel_Schools()
	 * @model containment="true"
	 * @generated
	 */
	EList<School> getSchools();

} // SchoolModel
