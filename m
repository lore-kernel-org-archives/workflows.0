Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C644A248886;
	Fri,  6 Feb 2026 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770393892; cv=none; b=N9ETmBk9HD+ONoiaVjwbRKthgBKJIVSeRTmdCBlNZS2vMbEYyd1w7jsrI0vY+LmApPQGCKUHQkOEEPCPS3p1d7pClmThShlMf8bIr+eQ1NuyGM7t8PjC5VnS1aK1yj2K69XWN6zq3OCI/iew+n/56lZurdXhV8z9rSlpBwD4D14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770393892; c=relaxed/simple;
	bh=rMt+oEPOBNs647Je+2cn/FE8wCyAu05qf9k9pjw2eIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e55jtF489BrALJTyA3skx+sXlV6HTKbXl6QVRx+c8BV30tTsyCerFPrUw6BUJCXqZcuXo3IFRykSOFpbEb/KmWZqf+jeQMWRK9CmAkInl4YJSL6cqIzwPV3G3/ty+/HaRW4pN6DBo5Y8ZbIf0TtXAIfa1hfJdafldMbYQd2Gaqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=o8IHcpcK; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="o8IHcpcK"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D70E240B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1770393885; bh=rMt+oEPOBNs647Je+2cn/FE8wCyAu05qf9k9pjw2eIw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o8IHcpcK0cGPosLoij0qn6dL6no4aSo6UVsBH1MwNtyrMVLgiWtX0Hg1ScFzvt7Wr
	 +W0PMhncklXFRPv1gN1f63A3rx4CmzoW1uxTNPlQlr8LM4gKPCNfrJPxiYp8ynuUYg
	 l+zY++5xUOpZtAJpYrYBoCwnpFXagQsegSWesgCcI3qOrxFK7ejsL+v291Y3w+/0z7
	 VDJtgzjSh3mgBZpI9dJfcgOvgz9HK+ni5EZU/KdAipxNaeR2CxeXKnPBgV6Xo5OkeY
	 ZocjinXr//COBrG9qI6r7MrjHnJdPnxvR92oGbp2NA16PzPpy98rqaCfxYZ1MbPalO
	 MlLSHD2hNKyrA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D70E240B4E;
	Fri,  6 Feb 2026 16:04:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <mricon@kernel.org>, Amitabh Srivastava
 <amitabh@amidevlab.com>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update
 kernel.org docs link
In-Reply-To: <95e18b9f-1426-44cd-a5f1-fca5bd122450@app.fastmail.com>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <95e18b9f-1426-44cd-a5f1-fca5bd122450@app.fastmail.com>
Date: Fri, 06 Feb 2026 09:04:43 -0700
Message-ID: <87fr7deu3o.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Konstantin Ryabitsev" <mricon@kernel.org> writes:

> On Thu, Feb 5, 2026, at 06:55, Amitabh Srivastava wrote:
>> Update http link to the documentation about how to add a kernel.org UID to
>> the maintainer's key. Add missing SPDX-License-Identifier to fix a
>> checkpatch warning.
>
> No objections from me, but please check with other reviewers if they want another revision.
>
> Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

I think we've probably done enough rounds on this one :)

Thanks,

jon
