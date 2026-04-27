Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97A43BED27;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294817; cv=none; b=Sr7EVSMcQRGUYMyxMiZWHc6gcrln6g5xZmQrzn+dHHuF3LBkUzuyV1ekw6sUGmcAcstnP64vHpdLRASYWUwrY0zA6/T8M7nRzqfw2sMKQB6UfgZyWiZ612vrGnNmUPf8/8MZSMRZWXo6HtNlNujg1VWSG2/3AbDXK6OUeTC44SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294817; c=relaxed/simple;
	bh=0/HTY/j+rmONwTz1eYmFn0WIHlokjtE9NUEt4Mkvjgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=db6xq4IdXBc4xFXGEiBgZyv/SpwaCLKnxQcKDOZl+Tiq8dSaIgo30VRQuHuQLlPHmz4ThwOqziiMLfPFg+ZYeejVyGKiSTcSpAUKpNBwBLgVkWUgwiyfqQUEuCkaIlq6lzHLPLRFYpRpVJ6U55U1ctvm256mjnrP3PWJLnmABOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAQj93gU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAQj93gU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A927AC2BCB7;
	Mon, 27 Apr 2026 13:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294817;
	bh=0/HTY/j+rmONwTz1eYmFn0WIHlokjtE9NUEt4Mkvjgs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KAQj93gU9gv34gCWYtb+46HC164jS3Pwxjkh3KDzL0QLYF4OHM7CeLKz/24t6pjIP
	 u+ADvE4XQNKCuFyN2UZ9I4wwdgZpUnO6tM2rLUI/gcUnZD/RR3vzj9j8KnS6PGDGVU
	 5bpHW2BQpBIfeshvd9r5w77kdPxTNW/JIy4b4xQ9UOlnFi8s/HsUKj6t43tPUC4hYj
	 0wYlp0IL2fq0Ay9zJF4CArWOEQXoKUanKSaQ271IV+gbDP9gEYBGfnvPukbdv4zrIa
	 oosOoAn/bmpfiOamjAw7pyg3HInwZ6KhhlAZJlzb/cpf4p/3rnBAnaYJq/FLLxUxu2
	 nLWCdLEbtWonQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZP-0000000Bx3c-3MzY;
	Mon, 27 Apr 2026 15:00:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Dan Williams <djbw@kernel.org>
Subject: [PATCH v3 02/12] MAINTAINERS: add maintainer-tip.rst to X86
Date: Mon, 27 Apr 2026 15:00:02 +0200
Message-ID: <35abbf65385910c4c69d571dbf0d10b2a75b6fa9.1777294623.git.mchehab+huawei@kernel.org>
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
index f52ec50f6d10..a00d4ba61c2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28808,6 +28808,7 @@ M:	Ingo Molnar <mingo@redhat.com>
 M:	Borislav Petkov <bp@alien8.de>
 M:	Dave Hansen <dave.hansen@linux.intel.com>
 M:	x86@kernel.org
+P:	Documentation/process/maintainer-tip.rst
 R:	"H. Peter Anvin" <hpa@zytor.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-- 
2.53.0

