Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736673C3C15;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294819; cv=none; b=BmDxjE+PKnSEXZulM3rZZt9Wdcn+XHXhtZ8RYfEu830sjqMzA7EPi5nX+Z4Jw9MdBNF3pDToDmYis/QOEFWNbTkBCfpftzkuWmxNvGUn+vR/HAxh4YoFOgvpKfjamKpbFYshiV2HgommVdSCcsy/A6QieG5sUfr+T9D5gWx0920=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294819; c=relaxed/simple;
	bh=BpJ6sywaSZVQxAguZ1xiEWvvUTov0XqlViROQ62XlmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jmw4tcT6Ih95pvwnIy7XIflr12ripL2UM8t3DK18QdTbkOwLgQacg0DH1WZnUhscpAcaIbhdZKZCM1fsb9d25EOjJlUGjLw5cPvYlZQIYJ3z00Ws1jOrPRRkuvvsiyR6NKRavEHr5NN1hwiS7cH8EmuHUx++GoQ8psKOZ5hOiX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzkqsMhj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzkqsMhj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349A4C2BCB4;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294819;
	bh=BpJ6sywaSZVQxAguZ1xiEWvvUTov0XqlViROQ62XlmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gzkqsMhjuF/OjfSGRMS2/YtvqWJONB+/N9KHoHvaPqowbgBX/C+ohdS4PcckRp0lK
	 1TcjU518b5FbwkmQhpKhnKegNIGfg1hWKVUToSQnruMEMdlxdfzPOxatyB1Eb/IQ95
	 QeJSKwmQ2kffONun4FpfnG++ADf3cZsSB7LEfuAB7CCyXKVbH57lVcB5pWSsOv85W+
	 gS9oR4f4MlV06uk8HFRhaJOlN/1ed56DCk4xZD6KdEKDU0jT/A+43NqeKFi4NIf8XF
	 xt1tV914NnJ3S4HaVOImVa/cY/1mwMg8QVlKPo60f8v8O4efbOuhSDqpBh3iS6QLoT
	 PFGBd3SwBQxtQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZR-0000000BxCQ-1y3B;
	Mon, 27 Apr 2026 15:00:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 09/12] docs: maintainers_include: Only show main entry for profiles
Date: Mon, 27 Apr 2026 15:00:09 +0200
Message-ID: <b724657f114b3cc63ff9d0e1115d8c2e439b81c5.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
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

