ALTER DATABASE gveloz CHARACTER SET utf8 COLLATE utf8_unicode_ci;

CREATE TABLE userProfile(
	userProfileId BINARY(16) NOT NULL,
	userProfileDob DATE,
	userProfileEmail VARCHAR(120) NOT NULL,
	userProfileGender CHAR(1),
	userProfileName VARCHAR(32) NOT NULL,
	PRIMARY KEY (userProfileId)
);


CREATE TABLE content(
	contentId BINARY(16) NOT NULL,
	contentVideo VARCHAR(4000),
	contentText VARCHAR(200),
	contentUserProfileId BINARY(16) NOT NULL,
	INDEX (contentUserProfileId),
	FOREIGN KEY(contentUserProfileId) REFERENCES userProfile(userProfileId),
	PRIMARY KEY(contentId)
);



/*weak entity*/
CREATE TABLE reaction(
	reactionUserProfileId BINARY(16),
	reactionContentId BINARY(16),
	reactionType BINARY(10),
	INDEX (reactionUserProfileId),
	FOREIGN KEY(reactionUserProfileId) REFERENCES userProfile(userProfileId),
	INDEX (reactionContentId),
	FOREIGN KEY(reactionContentId) REFERENCES content(contentId)
);