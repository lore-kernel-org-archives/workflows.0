Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433CD1C860B;
	Sat, 29 Nov 2025 15:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764430942; cv=none; b=Z3W8d6ULKBbO0TqG8BgrUdGgmtT1WxJv5hbSIV1cYtDgVZgqdyboYI0pvj3IpPHECgdURWNj91vbtugdq0e4J48ftES8rWk2qNsbFuzyAA3hNE9aNE1LbH8mWxbrdIanurIo9dL0InIpAkhvzRkqa4FDxvoQo7hDcc5jtIi0s2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764430942; c=relaxed/simple;
	bh=8/4zdMnEvlRcv++rWNoyR2HjIShiXSDT4Yp9Du2J5qo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YKU09Tfrq88XlQHJ1fyoqQNxxkIfLRkx1vdsUsN6NLsGdQSMIm9+AjLhVYot+Rivg1Qq5pidzvgDDlMXs8CWYAHnUy3gop3hvDCEiPSbNhR1yPn8Mqv7RvRf4EUc+J5Hnc21kJgQnnEmU4QoPm3pw3wzXG8+qRr6jiVE8GU8B6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RuIr82pp; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RuIr82pp"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 67B27406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1764430940; bh=cY1sxH2qV+7aqm/6yiBv+nEGUCWX+fChM7asnKti1mQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RuIr82ppBR9JsqX4M1lzBiiGLfQNn37k4lORqCJBPAoDYGQ/K5WSMyD5Qt/cdp9DF
	 dJNHKIZMN1I/xibGQMZX5qDdcIUitSNwh+n55Q4ckh7GN7oHCTUhS0LB+Qfsdga7kU
	 Ou1Xewqgp9x9BlqMHQwIY7x6mT+Sbl4A7d87Nj3kDtXn+qMmp0VsU79eVb+IsnUKKP
	 3zpHRrXOrjY1+N05Gemv1EQDYDFbhNi9xc2CH6FiSs6xlgEePfV9Lh3gz1O9hjN4M/
	 +HBKQPR8QmxqD+K+PVHv0o7Ndo0YHOHVzAbYvrIrdDKDerkbgu6hBU/p4t0rt2JYxp
	 x37/speW8YT/Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 67B27406FB;
	Sat, 29 Nov 2025 15:42:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>, linux-doc@vger.kernel.org
Cc: josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 workflows@vger.kernel.org, joe@perches.com, rdunlap@infradead.org, Sasha
 Levin <sashal@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v5] README: restructure with role-based documentation
 and guidelines
In-Reply-To: <20251121180009.2634393-1-sashal@kernel.org>
References: <20251121180009.2634393-1-sashal@kernel.org>
Date: Sat, 29 Nov 2025 08:42:19 -0700
Message-ID: <87v7isq204.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> Reorganize README to provide targeted documentation paths for different user
> roles including developers, researchers, security experts, and maintainers.
>
> Add quick start section and essential docs links.
>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>
> ---
>
> Changes since v4:
>
>  - Remove explicit reference to GPLv2
>  - Fix up the commit message to drop AI blurb
>
>  README | 160 +++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 149 insertions(+), 11 deletions(-)

Applied, thanks.

jon
