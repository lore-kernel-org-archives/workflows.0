Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6E72E738D;
	Fri, 29 May 2026 08:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042217; cv=none; b=ihA744YSvZvNZWh53MgeEO5JuYSLR5s6C+3VgrCBqgyzbeE3TP3v2LapSOUEN0QUmZ+9yQ4zBuowXTu83LW5r2pJrbYRPzyDq+dBmJcrlHuhw3Mv2MTJoZE3GN3ltPQI2Hdh68XdGlwqYkQ7krwt+RCgcKagFc1jRPu4p1kKJbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042217; c=relaxed/simple;
	bh=0W72ydZqmI6mxoK1+bSQsOPKaMVOTs3M3FlsTpigygw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NKdrq0Jaz/1dm5cQgC3Nmh70yb/QVpON2lTfimUqEeQsmNdTkDd/ibAB/QuvaxZCDcgm0S8JWAgNHvtyvRdTLu/002KExf8ye186qIHLkliWQ9Op04Q3PRks+n4JWnn5mEIRKYeN2H5jn67ugmnsTJKWK/UcrLMWZYeVLwFtUDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwGB8HVG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwGB8HVG"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B68501F00893;
	Fri, 29 May 2026 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780042216;
	bh=V5qRgA2ROeHWtOc+ZEDIqpNcjk2nHWKmuZJ6ZxGRCmc=;
	h=From:To:Cc:Subject:Date;
	b=LwGB8HVG5+dtrFJR7Zl8nYKLjd+YcQ7vDN6Nh5OopGf3FccvZ2tlc18LqpXLl0XAZ
	 TYgBU9RmYRIzugsaV/kYtFMvIaQ5KVjP4aeJdvAdCgR7xM8XDl0epi3BcnUfQ6xqyL
	 Pa0SJltGFSXqMweJcUWa3Qro8nm5htfokcPYHEhFnrfNiQZtAuUWwnrGM3ngO83R2M
	 eboQmYzTUud+IX6GHtYy0nFPBsUu2BoQPyTsKpkWKLCReCJquqNqobt+ABVG9llua2
	 JnlSg/LFARE1qW5nSIdI2ziR10uyjHhx0B3moyq4V4icA7wHT3VtBHh9ec6OkvuhKW
	 CzoA2PT3KCMrQ==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Manuel Ebner <manuelebner@mailbox.org>,
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
	SeongJae Park <sj@kernel.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: Fix syntax of kmalloc_objs example in coding style doc
Date: Fri, 29 May 2026 10:10:05 +0200
Message-ID: <20260529081006.2019687-2-ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175; i=ukleinek@kernel.org; h=from:subject; bh=0W72ydZqmI6mxoK1+bSQsOPKaMVOTs3M3FlsTpigygw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGUneaKniyMOCFm/99aBv7XGHqSBw9VpaWPFMo pTAmNWjPSiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahlJ3gAKCRCPgPtYfRL+ TgHXB/wI+7j87/JPTHpITBfEu3OAwThBxY7QkYzwhbltecfNAdKWXXMlArgajIrUtgDi9G0Q8H3 1qqa5C35i3Sr4bgbUegKy5bJ4L6FR/Jiynu4SPNO3eerQ5J93nh6AG+HLE0o0mDLftVf34drzVt q2Sm+QPCkxEnOYVSbX4WEV4P6bhfcejgWGKqv+4jNXZfI8ppeVnaeV8d+PZ9jT+7yTP8Dt07rhQ GmemAVlJwF60g1PfILQ59v8hfr8gRovRVoRaso+eSSCaVWzl7mFPp9BdHqjTSm6saik9ly9wUtN u83fyjpA//GoJ/9KUcrl6GIvx6/NzoxqyMS/MP81v0mQhNH7
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The first parameter should match the variable that the allocated memory
is assigned to. Fix the example accordingly, the one for kmalloc_obj got
it right already.

Fixes: 7c6d969d5349 ("Documentation: adopt new coding style of type-aware kmalloc-family")
Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 Documentation/process/coding-style.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index a3bf75dc7c88..a8336582f60b 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -959,13 +959,13 @@ The preferred form for allocating an array is the following:
 
 .. code-block:: c
 
-	p = kmalloc_objs(*ptr, n, ...);
+	p = kmalloc_objs(*p, n, ...);
 
 The preferred form for allocating a zeroed array is the following:
 
 .. code-block:: c
 
-	p = kzalloc_objs(*ptr, n, ...);
+	p = kzalloc_objs(*p, n, ...);
 
 Both forms check for overflow on the allocation size n * sizeof(...),
 and return NULL if that occurred.

base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
-- 
2.47.3

