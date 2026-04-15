Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7E3358D3;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243149; cv=none; b=V4FqeizxTwcNybb6wK7nUb5w2hRklArOaN70a/IWx6bgaonyFz8VU91tapENZ5ELiwroonlhhi34ytqMQtVShJIvo+AmMwUyGZIzystb52IwHxKUG73wgBZN5f2xh1FzRXPkKH3IZTDqgRJIvnprXXZhvWjF1//f7YU2an5X9eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243149; c=relaxed/simple;
	bh=etykI6PjHqrvsDMvEbWFzTQyXVYcIo7uusJigHM5MX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X9PeXdMlS87eqaalxp5b6Q69V0kHZBkxCTFJN+5AlJ+/wUWfMFSSxgYyuDKKiTUXSBuutymSezgwpBsIHfmMY7Z4UkIkx/sgm7Z7MjafCbrp5fmo2PFIFLEbPIV8ve0ZKpkA15f56IwQvp3ln9S95sBNEHce+HRG+miV7F5KUA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLT+i3x+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLT+i3x+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0E2C2BCB5;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=etykI6PjHqrvsDMvEbWFzTQyXVYcIo7uusJigHM5MX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uLT+i3x+2bXN9aNEgYkjT0HDVZYxmDo/otJ3pDZTcm5meLhD+9cHEDTUUrL+WFRAG
	 UoxKwcQMrB8JDHyKyYiOzQKOmYB87y8dV1PfyPbnPo/PeiiQi7C3Vgjg4q2d7fBPOr
	 Oj+dJAIV5SHTi7kUGl+3ADSZqT87kshLW1Uemk2R1A9hiEw6GJbA9BPxsTROakOrBu
	 ifxwe17WvNjr5kEoM3fzDxDYEyay6JtKxZEQ1XW9Tmuvjw3HLVd8k7NKS0opX8t2mI
	 E3HehiCjYMvVQw+8yO1GSEdhzzEtmLalxCL4oRc/EWegKymcbOCFlnTnBbq/31XJkP
	 Qbwfhh9x5WPzA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELw1-2dF2;
	Wed, 15 Apr 2026 10:52:27 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Dan Williams <djbw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 4/8] docs: auto-generate maintainer entry profile links
Date: Wed, 15 Apr 2026 10:52:20 +0200
Message-ID: <08d378395b417160adbdef013cd8a0b24fe08bfd.1776242739.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776242739.git.mchehab+huawei@kernel.org>
References: <cover.1776242739.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of manually creating a TOC tree for them, use the new
tag to auto-generate its TOC.

Co-developed-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <9228f77b0339b8e5dea4a201ab6d4feb30cef5c2.1776176108.git.mchehab+huawei@kernel.org>
---
 .../maintainer/maintainer-entry-profile.rst   | 24 ++++---------------
 .../process/maintainer-handbooks.rst          | 19 ++++++++-------
 2 files changed, 14 insertions(+), 29 deletions(-)

diff --git a/Documentation/maintainer/maintainer-entry-profile.rst b/Documentation/maintainer/maintainer-entry-profile.rst
index 6020d188e13d..58e2af333692 100644
--- a/Documentation/maintainer/maintainer-entry-profile.rst
+++ b/Documentation/maintainer/maintainer-entry-profile.rst
@@ -92,24 +92,8 @@ full series, or privately send a reminder email. This section might also
 list how review works for this code area and methods to get feedback
 that are not directly from the maintainer.
 
-Existing profiles
------------------
+Maintainer Handbooks
+--------------------
 
-For now, existing maintainer profiles are listed here; we will likely want
-to do something different in the near future.
-
-.. toctree::
-   :maxdepth: 1
-
-   ../doc-guide/maintainer-profile
-   ../nvdimm/maintainer-entry-profile
-   ../arch/riscv/patch-acceptance
-   ../process/maintainer-soc
-   ../process/maintainer-soc-clean-dts
-   ../driver-api/media/maintainer-entry-profile
-   ../process/maintainer-netdev
-   ../driver-api/vfio-pci-device-specific-driver-acceptance
-   ../nvme/feature-and-quirk-policy
-   ../filesystems/nfs/nfsd-maintainer-entry-profile
-   ../filesystems/xfs/xfs-maintainer-entry-profile
-   ../mm/damon/maintainer-profile
+For examples of other subsystem handbooks see
+Documentation/process/maintainer-handbooks.rst.
diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentation/process/maintainer-handbooks.rst
index 3d72ad25fc6a..531985a0fae8 100644
--- a/Documentation/process/maintainer-handbooks.rst
+++ b/Documentation/process/maintainer-handbooks.rst
@@ -7,14 +7,15 @@ The purpose of this document is to provide subsystem specific information
 which is supplementary to the general development process handbook
 :ref:`Documentation/process <development_process_main>`.
 
+For developers, see below for all the known subsystem specific guides.
+If the subsystem you are contributing to does not have a guide listed
+here, it is fair to seek clarification of questions raised in
+Documentation/maintainer/maintainer-entry-profile.rst.
+
+For maintainers, consider documenting additional requirements and
+expectations if submissions routinely overlook specific submission
+criteria. See Documentation/maintainer/maintainer-entry-profile.rst.
+
 Contents:
 
-.. toctree::
-   :numbered:
-   :maxdepth: 2
-
-   maintainer-netdev
-   maintainer-soc
-   maintainer-soc-clean-dts
-   maintainer-tip
-   maintainer-kvm-x86
+.. maintainers-profile-toc::
-- 
2.53.0

