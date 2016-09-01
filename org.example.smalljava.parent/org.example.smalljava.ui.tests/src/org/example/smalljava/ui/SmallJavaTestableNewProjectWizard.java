package org.example.smalljava.ui;

import org.eclipse.xtext.ui.wizard.IExtendedProjectInfo;
import org.eclipse.xtext.ui.wizard.IProjectCreator;
import org.example.smalljava.ui.wizard.SmallJavaNewProjectWizard;

import com.google.inject.Inject;

import static org.example.testutils.EclipseTestUtils.*;

/**
 * Manually set the project name (usually set in the dialog text edit)
 * 
 * @author Lorenzo Bettini
 */
public class SmallJavaTestableNewProjectWizard extends SmallJavaNewProjectWizard {

	@Inject
	public SmallJavaTestableNewProjectWizard(IProjectCreator projectCreator) {
		super(projectCreator);
	}

	@Override
	public IExtendedProjectInfo getProjectInfo() {
		IExtendedProjectInfo projectInfo = super.getProjectInfo();
		projectInfo.setProjectName(TEST_PROJECT);
		return projectInfo;
	}

}
