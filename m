Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60D318C05;
	Sat, 13 Jul 2024 23:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720914626; cv=none; b=KyHviAXx5zImoDZrdcX64l+8TMcy4YIrKLWHtBUJJRAgpKzPGCWCTWSX6WhaccGDCho4Hj7C3Dpvu3ICiUtA8qgknJcyBCMy6ovjurILwTrxqzkWWlpkpi0hPgiaauICfD2UbZ38ctylYTVWmPjx9r1hRCYTWJ43YaQs86+Glso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720914626; c=relaxed/simple;
	bh=aGWZuwV0PpDPV0E+Zl/McKE1gNH9uRZN2MUEddWSwj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vDOvH6J8GbidOJRNlIJtwdZoEelNWH2lSteksLuHTYk5krEyr0mF/pJgNN6wCXMNCjRk0gVxQfS9eW4WwKSRssZCH9r8zuqj9K4n3GcCHTgzN270idVbJ4Vf3W/D6xj/HzaTHphJ3YVNYiFGcmLeP8bIJ7hurggoc+nw+WGj1GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmoVLBWG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmoVLBWG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED43FC32781;
	Sat, 13 Jul 2024 23:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720914626;
	bh=aGWZuwV0PpDPV0E+Zl/McKE1gNH9uRZN2MUEddWSwj4=;
	h=From:To:Cc:Subject:Date:From;
	b=mmoVLBWGC436G03BqUF4hH8vOD+s6YCXj+1sOGcvf0ext671EthCpnyNByMfdLdLN
	 Wcg2md2Ju6o6KNm262dmZpGmlypLJv4AbhC7DasIGZ+dwjWQcc48rgQrjEWEvwiM/9
	 Ft+tgwylqwVriJs+RpNTgs72fZeRvog6sN1gOs7gov7pujntfHJmv/49u74efbnCY5
	 S6cMndo+VWr5BGrEt/5ekhK4/o/fYNMacvyQqYq9KKPf2b22HCOFuGYlY9Ep0UODiM
	 HumrThr8HiM398DMtpjf0jevctpOSZOF+fp0z0JUWg9VlTt/hYpz82wXgRSjVKNisc
	 pQTmesXRBaUKA==
From: Jakub Kicinski <kuba@kernel.org>
To: corbet@lwn.net
Cc: Jakub Kicinski <kuba@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	mchehab@kernel.org,
	dan.j.williams@intel.com,
	laurent.pinchart@ideasonboard.com,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] docs: maintainer: discourage taking conversations off-list
Date: Sat, 13 Jul 2024 16:50:20 -0700
Message-ID: <20240713235020.820910-1-kuba@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiple vendors seem to prefer taking discussions off list, and
ask contributors to work with them privately rather than just send
patches to the list. I'd imagine this is because it's hard to fit in
time for random developers popping up with features to review into
packed schedule. From what I've seen "work in private" usually means
someone on the company side will be assigned to handle the interaction,
possibly months later. In worst case, the person scheduled to help
the contributor takes over and writes the code themselves.
This is not how the community is supposed to work.

The discussion on v1 wasn't very conclusive. I am not capable of
distilling many of the suggestions into meaningful changes.
I believe the paragraph works in the context of the document.

FWIW the paragraph has been consulted with 2 contributors to whom
the described situation has happened.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
Encouraged by the immediate acks from notable folks I'm submitting
again, although I'm tempted to resend as part of maintainer-netdev :(
Please do read the rest of the doc to understand the context:
https://docs.kernel.org/next/maintainer/feature-and-driver-maintainers.html

v2:
 - replace mailing list with "forum" to avoid excluding GH / GitLab etc
 - call out private >email< conversations, face-to-face conversations
   are obviously fine
v1: https://lore.kernel.org/20240712144903.392284-1-kuba@kernel.org/

CC: mchehab@kernel.org
CC: dan.j.williams@intel.com
CC: laurent.pinchart@ideasonboard.com

CC: workflows@vger.kernel.org
CC: linux-doc@vger.kernel.org
---
 .../maintainer/feature-and-driver-maintainers.rst     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/maintainer/feature-and-driver-maintainers.rst b/Documentation/maintainer/feature-and-driver-maintainers.rst
index f04cc183e1de..fb94a9b29061 100644
--- a/Documentation/maintainer/feature-and-driver-maintainers.rst
+++ b/Documentation/maintainer/feature-and-driver-maintainers.rst
@@ -83,6 +83,17 @@ bugs as well, if the report is of reasonable quality or indicates a
 problem that might be severe -- especially if they have *Supported*
 status of the codebase in the MAINTAINERS file.
 
+Open development
+----------------
+
+Discussions about user reported issues, and development of new code
+should be conducted in a manner typical for the larger subsystem.
+It is common for development within a single company to be conducted
+behind closed doors. However, development and discussions initiated
+by community members must not be redirected from public to closed forums
+or to private email conversations. Reasonable exceptions to this guidance
+include discussions about security related issues.
+
 Selecting the maintainer
 ========================
 
-- 
2.45.2

