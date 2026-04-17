Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFDE363C46;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406287; cv=none; b=i+vCu05LVunVVJc+e1H0PV4bO8zVDSPnl7DEuQCAtKiQiSlCWbWLbvUgg5Hbh7SyzMGStrpFYtGQ3BON3kOmaeYEnaSe9vYgxpZXK07dSZoLyQdTgMS3M8Lb8llhkvxqK10qDAcgkOQBUd40v5GekLHAfF5zQ4vs9stl/Oa8SrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406287; c=relaxed/simple;
	bh=cbloFBaSFVqLFASbOdMdsq9XcyspmRgafo7Pco+EW+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LCB6s4srYsxjH6I+wfdQhjxzN8wragAmneSj5sVdvC/MFEvy20NLFdkiqG2nibXK9gvZQbJhxCkcd49YxrAD3sqhwxCArPYkRLkI/jXqxRV+2X5Ymx8dryA3sKtT/t3A7iUpV0Jpi5hvWXLGSplTQ8GJ5d7Z/GdIwU2Ss9MTswQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRk1g6we; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRk1g6we"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5734BC4AF09;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=cbloFBaSFVqLFASbOdMdsq9XcyspmRgafo7Pco+EW+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lRk1g6we/NrjPuRtqhvHjM8xA2V2X/BOvwD290+yMFOOnhf3xrhEtdtRjX0gc3OKF
	 gbLrD2lDwMZ0DZr36tS4+4TuVvMdV6aoKBfjAbvdwiv9Tt0zvanLsZ6ZDea8R0mmv4
	 veKZUUbbMn9vacpoYiDDBy2CN43HdAXLzSLfsl1PnW1K0McQNmYyjc+lnd+q812rTQ
	 7S3V5wsgpLF5q57iRBe4UTpfv+er5Aj7IHP3naNQwvDr4WW8tYl8wkFi7oyA48mPIJ
	 MqaNs2XfEHTVu55ZU6pxn6OKL6LSZjQgiNiVYj6XiUpkgeJzeJ/0l/R2c4oY+Nke7w
	 hlQ1kT1UXLlug==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8sV-21d5;
	Fri, 17 Apr 2026 08:11:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 02/11] MAINTAINERS: add maintainer-tip.rst to X86
Date: Fri, 17 Apr 2026 08:11:12 +0200
Message-ID: <9711e3ed5898226173768725836e536d6c759a18.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The X86 subsystem has a maintainers entry profile, but its entry
is missing at MAINTAINERS.

Add it.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Message-ID: <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 620219e48f98..a85fcae5f56e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28560,6 +28560,7 @@ M:	Ingo Molnar <mingo@redhat.com>
 M:	Borislav Petkov <bp@alien8.de>
 M:	Dave Hansen <dave.hansen@linux.intel.com>
 M:	x86@kernel.org
+P:	Documentation/process/maintainer-tip.rst
 R:	"H. Peter Anvin" <hpa@zytor.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-- 
2.53.0

