Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D40395D87;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243149; cv=none; b=l5PXnA53AmMC6hd9uwOk/JuF+NcM37RG/B2L8ACXPmLREDjr8nGIDrsfD94ncdJzwfgAyhyZhkdqxT5grrIKwd3gKE6tJ1IUvrUMcC49i4fafjdXf9kl7EFXfgf92K84chboigc4j73zMft7ImZFlv5YxJniHX9AVZamhI9CaDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243149; c=relaxed/simple;
	bh=cbloFBaSFVqLFASbOdMdsq9XcyspmRgafo7Pco+EW+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMdmOQdSITnORHNK1YHkUP6aCyhwVMecMc79GG4vufWAIJ7erKPNDOeJnw1KX0o2WBix7+fFJimdog5vddQSjS4doSO+xwpesk0/bQUPKrfI8h9TpOtnK5mhqrZPczc5v4F8oN8r7x8ERHQPj2EQ9kJQbSa5Jj51nYcINiSa2eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i4H3d6VT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i4H3d6VT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E1FC2BCB4;
	Wed, 15 Apr 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776243149;
	bh=cbloFBaSFVqLFASbOdMdsq9XcyspmRgafo7Pco+EW+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i4H3d6VTT0QBatItEUbi/IXUeq2MLNYhTKRaPtwmlgVQ3zsu/Jg5XTgNPoWkJ7z1S
	 T20rvZA1BGK9BAzlRiMRsTngdbZO9VDzxLcl9TN0oron08gjUwGUHttU9c/AJyUEc/
	 vKc8c9pw1zWxeSw3rLGzgCTJX8/vctO7CbKows654qdZgyWxce7UCqQQkPpq29c3jK
	 tgfQZTs6/B+KmSbZe0iTOvEd9mzQLjK/cYfDiqPIfZmkETxrDmyXHnRnt/ud1qNCbc
	 zMl06JMkgOK25cLc5Lr93jUFj07tDfq3V/TWm2NnExFC/104c0koMrbGZYvBtDJ3VI
	 owP1Wu7hQoxlg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCvz1-0000000ELvf-2VCx;
	Wed, 15 Apr 2026 10:52:27 +0200
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
Subject: [PATCH 3/8] MAINTAINERS: add maintainer-tip.rst to X86
Date: Wed, 15 Apr 2026 10:52:19 +0200
Message-ID: <17bb9cbae60254adb388406a975f1fd60266afdc.1776242739.git.mchehab+huawei@kernel.org>
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

