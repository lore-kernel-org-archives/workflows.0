Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C3D3D6CD8;
	Fri, 12 Jun 2026 12:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268075; cv=none; b=OclEBV56SdyDdA/3Ipm6ITmsBsXjEBiYq1mr4qoGEfB+ktn9KId2gcWOhOUg8zsyVMIpyUUCBbx9YgPk9UGWk1xAAPrnr3PnX7MuJjQucWAJu4nolhyw/W8xLWwVWH9XOhBCas9kQmYoZgCoLDQjaLk+IBzC7x0Lloqf4NkEPdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268075; c=relaxed/simple;
	bh=6MlhDlUha3VJTuIZyXJwcWGd/xAPiFoKeqFo2YN2I9g=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ee6NIlHAiPQFHDVU0v5eU2w0ydVZ9T1jAeBRkeVIMIzU8QOTAguK62bvOSe6kBJjNfg+CxNAZOR9PkQzfx6gfZmEPXbD+/1ChpUJXgRD5qgw5PKvlCaq0zf275xyDSdInHU4gIoYT8l+lmkmxlOOJNFgw25theUQ75q2djBGjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PX6Q2X7F; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PX6Q2X7F"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F0B6B41591
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1781268068; bh=6MlhDlUha3VJTuIZyXJwcWGd/xAPiFoKeqFo2YN2I9g=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=PX6Q2X7F+km+v0jdqXYUoBzXvuUPwJrmaNIGT9fpaIkuky0xRuXY65jX8wjM8Cm7q
	 jWQmQ+MuggXIPWY0rJnmOAGMLdjdksX69KTCf6d5NPrca+bzMjt7sEVNLMX+jPJqrl
	 yrKXWvKAjV5+UKxfyhxUyWkQ18p6Exph6i5/ffMDD5DdAIwg+5IL+8dEtct1Q+GCaa
	 awPoqYWToHb+46xCkDiLIrkANPeRppes65CHX1uORddnKXZ/p5OrSKZIynKsEX4fBK
	 GnF/UgHS3WFZ+q4Yhs9qEzwRjCJGjXbvamPM/pSxyp235NMLwnEGhBhccES9MOBlY+
	 lIMKgfQZiq64A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F0B6B41591;
	Fri, 12 Jun 2026 12:41:07 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@mailbox.org>, Shuah Khan
 <skhan@linuxfoundation.org>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [Question] 5.posting.rst use To: or Cc:
In-Reply-To: <f55eb34b92a01159e0224611296fc51fcfb5ec5d.camel@mailbox.org>
References: <f55eb34b92a01159e0224611296fc51fcfb5ec5d.camel@mailbox.org>
Date: Fri, 12 Jun 2026 06:41:07 -0600
Message-ID: <87ik7o9bj0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebner@mailbox.org> writes:

> so every time I send a mail to lists or maintainers I have to choose: To:
> or Cc:. I did look for an answer in the Documentation but couldn't find
> one.
> I think if there is an answer then it could be added to 5.posting.rst .

Normally you would To: the maintainers, CC: the rest, but the end result
is the same either way - it really doesn't matter.

jon
