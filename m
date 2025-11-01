Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42BA223311
	for <workflows@vger.kernel.org>; Sat,  1 Nov 2025 22:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762036296; cv=none; b=d1moQKRPa9YwXCzw3La1ntrT51qfvMPW29H20lyIlUvn9AD8LRX51BXmccVKHN3GNQ76CR8FPMYtJR3tdi6TeYNbQNLS74tbVbLp3nfx6BTzyZ9cAY3uusXiJpyFixoDiDmwNAzyM2+7rCJXAyFSOz85JoJADrPYzit94HsRyBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762036296; c=relaxed/simple;
	bh=JqArab//VtjVTAuZADI3rtalHlSOh2zYSvZup8Qb328=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RK7WW2jvvVT5iTaRsJE3aKZ6QyW785pHudl8/yvm4ZpkEIl9xgJgQlOONpmGuPP45zXUC0BJ/trbUNyDeT9edueRE0/UU2wDbRM0pWQbBNHgKm6j2SPt9dvxkjM9IFgJrV0/X1lDRuhKC/ES1vOIDE1LS8EEgWjC8U1+XWYUcAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=T4RQRs7R; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="T4RQRs7R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1762036286; x=1762295486;
	bh=JqArab//VtjVTAuZADI3rtalHlSOh2zYSvZup8Qb328=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=T4RQRs7R9UhpKAd9pi+kL4gwYCzU5y3djHNT1aDcRBbpt7tDrX0Alxn5Xh1GuhCoj
	 LjUHTjLhG6dFnFkHVXX2jPiWIzeeGxc94JrlcbpLgY8OVM2v+SYK0Qn0AiGieDbys/
	 44sAmcC0Zm/KlF59w0epCJ1yX4prfVCW/R9h3tOnNKJO1UKVxkzOROfO0lmmHmRWxL
	 C2bvsFSZ/QPmWX/gmWc6ZFsW5xBhvnOxsYO/ipDPTHdxT87OeqUlON7Fu9CgrdSst1
	 ijGyuJvjZfCaY7uPpGl6+QTyWdeZeEfHH0vw6cQDThxCKDXUrqU8hnUMOs1RwMwXbS
	 0cFTbhJljhLiw==
Date: Sat, 01 Nov 2025 22:31:19 +0000
To: corbet@lwn.net
From: Gabriele Ricciardi <gricciardi-coding@pm.me>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Ricciardi <gricciardi-coding@pm.me>
Subject: [PATCH] coding-style: fix verb typo
Message-ID: <20251101223027.171874-1-gricciardi-coding@pm.me>
Feedback-ID: 114464819:user:proton
X-Pm-Message-ID: deac9e48a8ef2c74c4177133565786595b6dcd84
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In the Identation section there is a list of instructions in
second-person. The offending line uses third-person singular.

Signed-off-by: Gabriele Ricciardi <gricciardi-coding@pm.me>
---
 Documentation/process/coding-style.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process=
/coding-style.rst
index d1a8e5465ed9..2969ca378dbb 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -76,7 +76,7 @@ Don't use commas to avoid using braces:
 =09if (condition)
 =09=09do_this(), do_that();
=20
-Always uses braces for multiple statements:
+Always use braces for multiple statements:
=20
 .. code-block:: c
=20
--=20
2.51.2


