Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8494316F856;
	Fri, 12 Jul 2024 14:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720795745; cv=none; b=B83Mf7vh3PVwO/b7gTQ20ojmrSmnLgaQ7A6+B3gjIU9yasauSjhWS2ajVoCoTQOuZ415hZWDQshe5kYIeQG5TBxvurcIG96y6En1WAF5axFkmVZxscQFqyGplwrknMH1vrfXzdJc5J6O5oWGSkKgJGNndzvZ/rkPmRsndOHNUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720795745; c=relaxed/simple;
	bh=0SqwIJO7LAMGvr6FODKuMskVBIlrJiXiKhXR+FTph7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0gEJ4zaLgRVRGKZze0a93Iu3vI+pk59nwG1RtEd38zqHpZ1qYqTVkiL+0hdO6wQHY9nUCn81sQLVOq+8bLiIPnZm13aCmtwh19sqUu7oa05dRDTmTKlKxdPjVfE41xjp81ovaJFRvYQHy2B2LVdlsu7lftD4RtsS6nTnFq1SYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNzT4Tq7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNzT4Tq7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D6FC32782;
	Fri, 12 Jul 2024 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720795745;
	bh=0SqwIJO7LAMGvr6FODKuMskVBIlrJiXiKhXR+FTph7c=;
	h=From:To:Cc:Subject:Date:From;
	b=lNzT4Tq78VU2a+kVXOC1xdgmh0U3Z0riIss0rHkWHJo0g39KJM2TKRWiwodtUq/Qj
	 L+TGY2gWzFwLFg3MWg9vFCSTVT1jYv5A/o+0AstR7ILpUXy/wXE3EnntBRhj4NnJNA
	 Doc7dosivAFL1lc3jLivYWj81f3pbb+RwMkAAVPowtMmm1S50vsuf+o/FowX4DBDD4
	 luNvQMERlE9wp6hMF4TjCqpBuByuRr6o8EpBCRxjQhz4Y8y/2KZ/rEn9Ptmk5Tdxml
	 ABx/yx/3e3zh0YycdDRMDrHphOFd+eJ/X3D1dvl4S5B8YYqRyxigFdgjpZUpiVpBTe
	 WWr+aTDYAUZiQ==
From: Jakub Kicinski <kuba@kernel.org>
To: corbet@lwn.net
Cc: Jakub Kicinski <kuba@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: maintainer: discourage taking conversations off-list
Date: Fri, 12 Jul 2024 07:49:03 -0700
Message-ID: <20240712144903.392284-1-kuba@kernel.org>
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

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: workflows@vger.kernel.org
CC: linux-doc@vger.kernel.org
---
 .../maintainer/feature-and-driver-maintainers.rst     | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/maintainer/feature-and-driver-maintainers.rst b/Documentation/maintainer/feature-and-driver-maintainers.rst
index f04cc183e1de..ac7798280201 100644
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
+behind closed doors. However, maintainers must not redirect discussions
+and development related to the upstream code from the upstream mailing lists
+to closed forums or private conversations. Reasonable exceptions to this
+guidance include discussions about security related issues.
+
 Selecting the maintainer
 ========================
 
-- 
2.45.2

