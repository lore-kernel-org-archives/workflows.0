Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A122C1E507;
	Mon, 22 Jul 2024 14:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721658560; cv=none; b=fG2qUhPdDsNQaeCFwCK6s0+uMIiusAHNAyhD6RukMeuvOtsecwidkPhNjxzQrs2evarNI+0trcoC2o4JWDnyi7Dv/xjjSt5aZaoBSuCJrorGOrNTqktYi6bibp1NBlEJnAmQ6ed0H9eCo+qIGb8E3qbXiFERVRIraXajPJuaej0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721658560; c=relaxed/simple;
	bh=nawEJ/cnK+iSS/sgAlnLxcMlOynnOMFPfCdkNDsifak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H1wr1wij3nSHIxBrUkdXCFHDEYVmI30NFk1rbOBS8b+5s7BREVzKi58/g3SEOh7xN9Z4jEHHBu0RPv/GU/8AJYWNOKgvi6Ob0lHFuOFwAZedsvPfpLyeiou1d0p39zPwi0dmFJxQpFE6nYtj5/JRVuoxoR9r24dw3OgXwSXjT28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nWSXgA3x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nWSXgA3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1589FC116B1;
	Mon, 22 Jul 2024 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721658560;
	bh=nawEJ/cnK+iSS/sgAlnLxcMlOynnOMFPfCdkNDsifak=;
	h=From:To:Cc:Subject:Date:From;
	b=nWSXgA3xRAz/MCfk1RLJ+jPvazzf0rgDA01B8eLfTx4eaV2+jRgeZENlOxxGSB5Fh
	 08ufh+cDCWypD1qdPIy8ExOqzS8WjXBCYKBa56sxQxoT04f8hGuFg9lcf5aBEk3EG8
	 ngKU5JvYA+5o4o64MNzkLO8sfQpkpK25jxLBrCDOpxFod2mVx/eTXAhY5P3hLWBMFF
	 XVXJOU3dM7yIzZohiDT99MMK6Jb6M5NmAPkNEyizDFOQ4IM5poR0kiYA59zwO483fI
	 9j+nesZMmw9Y2z8WD64YS0dZj49zcYa2h96tgpWaK82AmEASg01/VfSXp6fL7nmF2y
	 ZCZg51/FxNqIg==
From: Jakub Kicinski <kuba@kernel.org>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] MAINTAINERS: add Documentation/dev-tools/ to workflows@
Date: Mon, 22 Jul 2024 07:29:13 -0700
Message-ID: <20240722142913.1709594-1-kuba@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of the workloads@ mailing list was to make it easier for
maintainers who don't use lore+lei to subscribe to topics related
to process changes. In other words it should cover changes to Documentation
files which most maintainers should know about. Recent changes from Kees [1]
to provide guidelines on naming KUnit files did not fall under workflows@
since Documentation/dev-tools/ isn't covered. The patch volume for
dev-tools isn't huge and most of the changes are interesting. Add it.

Link: https://lore.kernel.org/20240720165441.it.320-kees@kernel.org/ # [1]
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ec6904cbfd1f..a85234de4fd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6680,6 +6680,7 @@ DOCUMENTATION PROCESS
 M:	Jonathan Corbet <corbet@lwn.net>
 L:	workflows@vger.kernel.org
 S:	Maintained
+F:	Documentation/dev-tools/
 F:	Documentation/maintainer/
 F:	Documentation/process/
 
-- 
2.45.2

