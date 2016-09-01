/**
 */
package org.example.school.school;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EDataType;
import org.eclipse.emf.ecore.EOperation;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.EReference;

/**
 * <!-- begin-user-doc -->
 * The <b>Package</b> for the model.
 * It contains accessors for the meta objects to represent
 * <ul>
 *   <li>each class,</li>
 *   <li>each feature of each class,</li>
 *   <li>each operation of each class,</li>
 *   <li>each enum,</li>
 *   <li>and each data type</li>
 * </ul>
 * <!-- end-user-doc -->
 * @see org.example.school.school.SchoolFactory
 * @model kind="package"
 * @generated
 */
public interface SchoolPackage extends EPackage {
	/**
	 * The package name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNAME = "school";

	/**
	 * The package namespace URI.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_URI = "http://www.example.org/school";

	/**
	 * The package namespace name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_PREFIX = "school";

	/**
	 * The singleton instance of the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	SchoolPackage eINSTANCE = org.example.school.school.impl.SchoolPackageImpl.init();

	/**
	 * The meta object id for the '{@link org.example.school.school.impl.SchoolModelImpl <em>Model</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.example.school.school.impl.SchoolModelImpl
	 * @see org.example.school.school.impl.SchoolPackageImpl#getSchoolModel()
	 * @generated
	 */
	int SCHOOL_MODEL = 0;

	/**
	 * The feature id for the '<em><b>Schools</b></em>' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_MODEL__SCHOOLS = 0;

	/**
	 * The number of structural features of the '<em>Model</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_MODEL_FEATURE_COUNT = 1;

	/**
	 * The number of operations of the '<em>Model</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_MODEL_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link org.example.school.school.impl.NamedImpl <em>Named</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.example.school.school.impl.NamedImpl
	 * @see org.example.school.school.impl.SchoolPackageImpl#getNamed()
	 * @generated
	 */
	int NAMED = 2;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int NAMED__NAME = 0;

	/**
	 * The number of structural features of the '<em>Named</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int NAMED_FEATURE_COUNT = 1;

	/**
	 * The number of operations of the '<em>Named</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int NAMED_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '{@link org.example.school.school.impl.SchoolImpl <em>School</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.example.school.school.impl.SchoolImpl
	 * @see org.example.school.school.impl.SchoolPackageImpl#getSchool()
	 * @generated
	 */
	int SCHOOL = 1;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL__NAME = NAMED__NAME;

	/**
	 * The feature id for the '<em><b>Statistics</b></em>' containment reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL__STATISTICS = NAMED_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Persons</b></em>' containment reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL__PERSONS = NAMED_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>School</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_FEATURE_COUNT = NAMED_FEATURE_COUNT + 2;

	/**
	 * The operation id for the '<em>Get Students</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL___GET_STUDENTS = NAMED_OPERATION_COUNT + 0;

	/**
	 * The operation id for the '<em>Get Teachers</em>' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL___GET_TEACHERS = NAMED_OPERATION_COUNT + 1;

	/**
	 * The number of operations of the '<em>School</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_OPERATION_COUNT = NAMED_OPERATION_COUNT + 2;

	/**
	 * The meta object id for the '{@link org.example.school.school.impl.PersonImpl <em>Person</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.example.school.school.impl.PersonImpl
	 * @see org.example.school.school.impl.SchoolPackageImpl#getPerson()
	 * @generated
	 */
	int PERSON = 3;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PERSON__NAME = NAMED__NAME;

	/**
	 * The number of structural features of the '<em>Person</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PERSON_FEATURE_COUNT = NAMED_FEATURE_COUNT + 0;

	/**
	 * The number of operations of the '<em>Person</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int PERSON_OPERATION_COUNT = NAMED_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link org.example.school.school.impl.StudentImpl <em>Student</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.example.school.school.impl.StudentImpl
	 * @see org.example.school.school.impl.SchoolPackageImpl#getStudent()
	 * @generated
	 */
	int STUDENT = 4;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int STUDENT__NAME = PERSON__NAME;

	/**
	 * The feature id for the '<em><b>Registration Num</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int STUDENT__REGISTRATION_NUM = PERSON_FEATURE_COUNT + 0;

	/**
	 * The feature id for the '<em><b>Teachers</b></em>' reference list.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int STUDENT__TEACHERS = PERSON_FEATURE_COUNT + 1;

	/**
	 * The number of structural features of the '<em>Student</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int STUDENT_FEATURE_COUNT = PERSON_FEATURE_COUNT + 2;

	/**
	 * The number of operations of the '<em>Student</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int STUDENT_OPERATION_COUNT = PERSON_OPERATION_COUNT + 0;

	/**
	 * The meta object id for the '{@link org.example.school.school.impl.TeacherImpl <em>Teacher</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.example.school.school.impl.TeacherImpl
	 * @see org.example.school.school.impl.SchoolPackageImpl#getTeacher()
	 * @generated
	 */
	int TEACHER = 5;

	/**
	 * The feature id for the '<em><b>Name</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TEACHER__NAME = PERSON__NAME;

	/**
	 * The number of structural features of the '<em>Teacher</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TEACHER_FEATURE_COUNT = PERSON_FEATURE_COUNT + 0;

	/**
	 * The number of operations of the '<em>Teacher</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int TEACHER_OPERATION_COUNT = PERSON_OPERATION_COUNT + 0;


	/**
	 * The meta object id for the '{@link org.example.school.school.impl.SchoolStatisticsImpl <em>Statistics</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.example.school.school.impl.SchoolStatisticsImpl
	 * @see org.example.school.school.impl.SchoolPackageImpl#getSchoolStatistics()
	 * @generated
	 */
	int SCHOOL_STATISTICS = 6;

	/**
	 * The feature id for the '<em><b>Students Number</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_STATISTICS__STUDENTS_NUMBER = 0;

	/**
	 * The feature id for the '<em><b>Teachers Number</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_STATISTICS__TEACHERS_NUMBER = 1;

	/**
	 * The feature id for the '<em><b>Students With No Teacher</b></em>' attribute.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_STATISTICS__STUDENTS_WITH_NO_TEACHER = 2;

	/**
	 * The number of structural features of the '<em>Statistics</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_STATISTICS_FEATURE_COUNT = 3;

	/**
	 * The number of operations of the '<em>Statistics</em>' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 * @ordered
	 */
	int SCHOOL_STATISTICS_OPERATION_COUNT = 0;

	/**
	 * The meta object id for the '<em>Iterable</em>' data type.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see java.lang.Iterable
	 * @see org.example.school.school.impl.SchoolPackageImpl#getIterable()
	 * @generated
	 */
	int ITERABLE = 7;


	/**
	 * Returns the meta object for class '{@link org.example.school.school.SchoolModel <em>Model</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Model</em>'.
	 * @see org.example.school.school.SchoolModel
	 * @generated
	 */
	EClass getSchoolModel();

	/**
	 * Returns the meta object for the containment reference list '{@link org.example.school.school.SchoolModel#getSchools <em>Schools</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the containment reference list '<em>Schools</em>'.
	 * @see org.example.school.school.SchoolModel#getSchools()
	 * @see #getSchoolModel()
	 * @generated
	 */
	EReference getSchoolModel_Schools();

	/**
	 * Returns the meta object for class '{@link org.example.school.school.School <em>School</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>School</em>'.
	 * @see org.example.school.school.School
	 * @generated
	 */
	EClass getSchool();

	/**
	 * Returns the meta object for the containment reference list '{@link org.example.school.school.School#getPersons <em>Persons</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the containment reference list '<em>Persons</em>'.
	 * @see org.example.school.school.School#getPersons()
	 * @see #getSchool()
	 * @generated
	 */
	EReference getSchool_Persons();

	/**
	 * Returns the meta object for the containment reference '{@link org.example.school.school.School#getStatistics <em>Statistics</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the containment reference '<em>Statistics</em>'.
	 * @see org.example.school.school.School#getStatistics()
	 * @see #getSchool()
	 * @generated
	 */
	EReference getSchool_Statistics();

	/**
	 * Returns the meta object for the '{@link org.example.school.school.School#getStudents() <em>Get Students</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Get Students</em>' operation.
	 * @see org.example.school.school.School#getStudents()
	 * @generated
	 */
	EOperation getSchool__GetStudents();

	/**
	 * Returns the meta object for the '{@link org.example.school.school.School#getTeachers() <em>Get Teachers</em>}' operation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the '<em>Get Teachers</em>' operation.
	 * @see org.example.school.school.School#getTeachers()
	 * @generated
	 */
	EOperation getSchool__GetTeachers();

	/**
	 * Returns the meta object for class '{@link org.example.school.school.Named <em>Named</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Named</em>'.
	 * @see org.example.school.school.Named
	 * @generated
	 */
	EClass getNamed();

	/**
	 * Returns the meta object for the attribute '{@link org.example.school.school.Named#getName <em>Name</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Name</em>'.
	 * @see org.example.school.school.Named#getName()
	 * @see #getNamed()
	 * @generated
	 */
	EAttribute getNamed_Name();

	/**
	 * Returns the meta object for class '{@link org.example.school.school.Person <em>Person</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Person</em>'.
	 * @see org.example.school.school.Person
	 * @generated
	 */
	EClass getPerson();

	/**
	 * Returns the meta object for class '{@link org.example.school.school.Student <em>Student</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Student</em>'.
	 * @see org.example.school.school.Student
	 * @generated
	 */
	EClass getStudent();

	/**
	 * Returns the meta object for the attribute '{@link org.example.school.school.Student#getRegistrationNum <em>Registration Num</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Registration Num</em>'.
	 * @see org.example.school.school.Student#getRegistrationNum()
	 * @see #getStudent()
	 * @generated
	 */
	EAttribute getStudent_RegistrationNum();

	/**
	 * Returns the meta object for the reference list '{@link org.example.school.school.Student#getTeachers <em>Teachers</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the reference list '<em>Teachers</em>'.
	 * @see org.example.school.school.Student#getTeachers()
	 * @see #getStudent()
	 * @generated
	 */
	EReference getStudent_Teachers();

	/**
	 * Returns the meta object for class '{@link org.example.school.school.Teacher <em>Teacher</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Teacher</em>'.
	 * @see org.example.school.school.Teacher
	 * @generated
	 */
	EClass getTeacher();

	/**
	 * Returns the meta object for class '{@link org.example.school.school.SchoolStatistics <em>Statistics</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>Statistics</em>'.
	 * @see org.example.school.school.SchoolStatistics
	 * @generated
	 */
	EClass getSchoolStatistics();

	/**
	 * Returns the meta object for the attribute '{@link org.example.school.school.SchoolStatistics#getStudentsNumber <em>Students Number</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Students Number</em>'.
	 * @see org.example.school.school.SchoolStatistics#getStudentsNumber()
	 * @see #getSchoolStatistics()
	 * @generated
	 */
	EAttribute getSchoolStatistics_StudentsNumber();

	/**
	 * Returns the meta object for the attribute '{@link org.example.school.school.SchoolStatistics#getTeachersNumber <em>Teachers Number</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Teachers Number</em>'.
	 * @see org.example.school.school.SchoolStatistics#getTeachersNumber()
	 * @see #getSchoolStatistics()
	 * @generated
	 */
	EAttribute getSchoolStatistics_TeachersNumber();

	/**
	 * Returns the meta object for the attribute '{@link org.example.school.school.SchoolStatistics#getStudentsWithNoTeacher <em>Students With No Teacher</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for the attribute '<em>Students With No Teacher</em>'.
	 * @see org.example.school.school.SchoolStatistics#getStudentsWithNoTeacher()
	 * @see #getSchoolStatistics()
	 * @generated
	 */
	EAttribute getSchoolStatistics_StudentsWithNoTeacher();

	/**
	 * Returns the meta object for data type '{@link java.lang.Iterable <em>Iterable</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for data type '<em>Iterable</em>'.
	 * @see java.lang.Iterable
	 * @model instanceClass="java.lang.Iterable" typeParameters="T"
	 * @generated
	 */
	EDataType getIterable();

	/**
	 * Returns the factory that creates the instances of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the factory that creates the instances of the model.
	 * @generated
	 */
	SchoolFactory getSchoolFactory();

	/**
	 * <!-- begin-user-doc -->
	 * Defines literals for the meta objects that represent
	 * <ul>
	 *   <li>each class,</li>
	 *   <li>each feature of each class,</li>
	 *   <li>each operation of each class,</li>
	 *   <li>each enum,</li>
	 *   <li>and each data type</li>
	 * </ul>
	 * <!-- end-user-doc -->
	 * @generated
	 */
	interface Literals {
		/**
		 * The meta object literal for the '{@link org.example.school.school.impl.SchoolModelImpl <em>Model</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see org.example.school.school.impl.SchoolModelImpl
		 * @see org.example.school.school.impl.SchoolPackageImpl#getSchoolModel()
		 * @generated
		 */
		EClass SCHOOL_MODEL = eINSTANCE.getSchoolModel();

		/**
		 * The meta object literal for the '<em><b>Schools</b></em>' containment reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference SCHOOL_MODEL__SCHOOLS = eINSTANCE.getSchoolModel_Schools();

		/**
		 * The meta object literal for the '{@link org.example.school.school.impl.SchoolImpl <em>School</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see org.example.school.school.impl.SchoolImpl
		 * @see org.example.school.school.impl.SchoolPackageImpl#getSchool()
		 * @generated
		 */
		EClass SCHOOL = eINSTANCE.getSchool();

		/**
		 * The meta object literal for the '<em><b>Persons</b></em>' containment reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference SCHOOL__PERSONS = eINSTANCE.getSchool_Persons();

		/**
		 * The meta object literal for the '<em><b>Statistics</b></em>' containment reference feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference SCHOOL__STATISTICS = eINSTANCE.getSchool_Statistics();

		/**
		 * The meta object literal for the '<em><b>Get Students</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation SCHOOL___GET_STUDENTS = eINSTANCE.getSchool__GetStudents();

		/**
		 * The meta object literal for the '<em><b>Get Teachers</b></em>' operation.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EOperation SCHOOL___GET_TEACHERS = eINSTANCE.getSchool__GetTeachers();

		/**
		 * The meta object literal for the '{@link org.example.school.school.impl.NamedImpl <em>Named</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see org.example.school.school.impl.NamedImpl
		 * @see org.example.school.school.impl.SchoolPackageImpl#getNamed()
		 * @generated
		 */
		EClass NAMED = eINSTANCE.getNamed();

		/**
		 * The meta object literal for the '<em><b>Name</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute NAMED__NAME = eINSTANCE.getNamed_Name();

		/**
		 * The meta object literal for the '{@link org.example.school.school.impl.PersonImpl <em>Person</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see org.example.school.school.impl.PersonImpl
		 * @see org.example.school.school.impl.SchoolPackageImpl#getPerson()
		 * @generated
		 */
		EClass PERSON = eINSTANCE.getPerson();

		/**
		 * The meta object literal for the '{@link org.example.school.school.impl.StudentImpl <em>Student</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see org.example.school.school.impl.StudentImpl
		 * @see org.example.school.school.impl.SchoolPackageImpl#getStudent()
		 * @generated
		 */
		EClass STUDENT = eINSTANCE.getStudent();

		/**
		 * The meta object literal for the '<em><b>Registration Num</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute STUDENT__REGISTRATION_NUM = eINSTANCE.getStudent_RegistrationNum();

		/**
		 * The meta object literal for the '<em><b>Teachers</b></em>' reference list feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EReference STUDENT__TEACHERS = eINSTANCE.getStudent_Teachers();

		/**
		 * The meta object literal for the '{@link org.example.school.school.impl.TeacherImpl <em>Teacher</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see org.example.school.school.impl.TeacherImpl
		 * @see org.example.school.school.impl.SchoolPackageImpl#getTeacher()
		 * @generated
		 */
		EClass TEACHER = eINSTANCE.getTeacher();

		/**
		 * The meta object literal for the '{@link org.example.school.school.impl.SchoolStatisticsImpl <em>Statistics</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see org.example.school.school.impl.SchoolStatisticsImpl
		 * @see org.example.school.school.impl.SchoolPackageImpl#getSchoolStatistics()
		 * @generated
		 */
		EClass SCHOOL_STATISTICS = eINSTANCE.getSchoolStatistics();

		/**
		 * The meta object literal for the '<em><b>Students Number</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute SCHOOL_STATISTICS__STUDENTS_NUMBER = eINSTANCE.getSchoolStatistics_StudentsNumber();

		/**
		 * The meta object literal for the '<em><b>Teachers Number</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute SCHOOL_STATISTICS__TEACHERS_NUMBER = eINSTANCE.getSchoolStatistics_TeachersNumber();

		/**
		 * The meta object literal for the '<em><b>Students With No Teacher</b></em>' attribute feature.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		EAttribute SCHOOL_STATISTICS__STUDENTS_WITH_NO_TEACHER = eINSTANCE.getSchoolStatistics_StudentsWithNoTeacher();

		/**
		 * The meta object literal for the '<em>Iterable</em>' data type.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @see java.lang.Iterable
		 * @see org.example.school.school.impl.SchoolPackageImpl#getIterable()
		 * @generated
		 */
		EDataType ITERABLE = eINSTANCE.getIterable();

	}

} //SchoolPackage
