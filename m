Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F283A3E8C62;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176960; cv=none; b=LY1q+6n/zjo2pXewBdoax9/Upc+wop5Mv0n+VXFROfqss1HqEMnPeken+9/YyRcBz9TKES3KxkxdpXkuM4rdd7s98NeX/0N3lZ86E5jqm77/AISUmA6QVqGpod6zUaCVaXaB6YpVhSNbQAx6bNqdFbGY6KScFZGRpJ4xT/HkZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176960; c=relaxed/simple;
	bh=CQbeQ8MaYMOm5iHoZvEQ/hMjNQ3Gji9XdVM+EDT+8Dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HS0f1GMElfqvtS+nRjtu0k5qTE9+cjmnFbPcPBOnxna37JV3gtkuU9i3zUnxfTSogLQVlTkAmHGRx5npcORk0U3v53ehBKXQ+1XJh0giXuyuWKw/4xxQdYq4qKlASDXEXbTo064q4hq2vt0e4HhAq80qRyZ8BAzp3aB6Jk3lN8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OV8wuFXI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OV8wuFXI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBD4C19425;
	Tue, 14 Apr 2026 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776176959;
	bh=CQbeQ8MaYMOm5iHoZvEQ/hMjNQ3Gji9XdVM+EDT+8Dw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OV8wuFXIDoAUX1rTDJ5kBHIhztHvdbBaaKuuVMRaLzaXaCH+VosQa6g9r+ggREXMA
	 n1d4eR+hlMXQyTyv93wDtk9S28wyfxb0X8+po4ZAP9PVk2OWN9eH0V9Am79RZBsxbi
	 nf6/h0lmTKyfraRTNBOjCWpaBvxJvfAq0Q3dOcmjq/Y00FM/yg6tRGd/uKAmYqglCU
	 BGYdvbycu3fZ9LlMl+AvQnEjftJdY1hC8QkNz51K+6vxfc3FilGgTintdNawNiS13m
	 Ruxa4cV2jTLztVfd37E9FJGk5uvE9kov0bdoII+Ucf2zB9tI1i4Y+jVcOVlOQFsA+e
	 yPsejlIvgMQKw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wCelR-00000007oP3-47RN;
	Tue, 14 Apr 2026 16:29:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH RFC 3/4] MAINTAINERS: add maintainer-tip.rst to X86
Date: Tue, 14 Apr 2026 16:29:06 +0200
Message-ID: <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While the maintainer's profile for tip is there, it is not
at X86 maintainer's entry.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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
2.52.0

