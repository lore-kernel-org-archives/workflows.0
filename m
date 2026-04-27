Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FCB3D47C5;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299756; cv=none; b=hVy67PkWNXOGpstwtfIsxhDcvB53rMpJ+Y2y8/F/HvyndFwsg1ys5WE2IgPV/8yhY8Okk7uc5qY0k7VPJYXlbiboyVFQq+gMgH/qiAflcvPCy/BVkulGk4hggOXLxTgA6fIHm9x0uJw3Q8szOGxBTLO8yurZ1gzHY89S/IuwVUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299756; c=relaxed/simple;
	bh=TwW+kGBiliF/Ei1obwlR1vu04Y0GBFL6iuNTaetPprg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CcQKrWMcB5khK3ZBHYwGhLDqA4aUy1Iaq7ARhbdBGrWoroYoKXZsXri6zdfKqtRO7xrkEP76p9s3hQZ4wzDhristYl5ai8dKQb2mG95q7D3tdUjKBtYligcNQyVUc2rEcw90M8O6F8pP80jTH1bv8vwlDiSGoVhnGCCo7zQ3rjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSTMxd4T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSTMxd4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A19C2BCFA;
	Mon, 27 Apr 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299756;
	bh=TwW+kGBiliF/Ei1obwlR1vu04Y0GBFL6iuNTaetPprg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mSTMxd4ToDGCw3AxRUTma98KSYjRKZe53RGL9TAtSIEZtuWS2RmKM8qWcPvWm/24C
	 ULgkySwstM1BDHcLs1onK2XyEdh0eNVKSLbQIhzOxKNGwyJsHjKidR8MN4vomVLsLa
	 xuSft7SpOwXeVyGvpxYinrZ9TKPMmG38Jc0FJ6xviwPo9vi74dgrZ+3lGW780trybI
	 OxRnioRbLzTkr5CM2xAlSrnoB+w3rQe6mgO5j/36BKx0NQNBWY0If7aFI9U6KxvNkM
	 11xsXjZ6oLHy22AofaeV4izPXnoort71M92uIa7bhaO8+eFCqEWyHeX26oN2tteAms
	 0OO6WlKFGKTQQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHMr4-0000000C8XO-2lV7;
	Mon, 27 Apr 2026 16:22:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 07/10] docs: maintainers_include: Only show main entry for profiles
Date: Mon, 27 Apr 2026 16:22:25 +0200
Message-ID: <387b42c523e7b9f33e61cdff6fadb1df265cf71d.1777295258.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777295258.git.mchehab+huawei@kernel.org>
References: <cover.1777295258.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of showing as a "Contents:" with 2 identation levels,
drop its title and show profiles as a list of entries.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/process/maintainer-handbooks.rst | 2 --
 Documentation/sphinx/maintainers_include.py    | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 531985a0fae8..3821e78aefc0 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -16,6 +16,4 @@ For maintainers, consider documenting additional requirements and
 expectations if submissions routinely overlook specific submission
 criteria. See Documentation/maintainer/maintainer-entry-profile.rst.
 
-Contents:
-
 .. maintainers-profile-toc::
diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 948746b998a3..7ab921820612 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -235,7 +235,7 @@ class MaintainersProfile(Include):
         maint = MaintainersParser(base_path, path)
 
         output  = ".. toctree::\n"
-        output += "   :maxdepth: 2\n\n"
+        output += "   :maxdepth: 1\n\n"
 
         items = sorted(maint.profiles.items(),
                        key=lambda kv: (kv[1] or "", kv[0]))
-- 
2.53.0

