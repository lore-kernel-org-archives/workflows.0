Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DA93502A7;
	Fri, 14 Aug 2026 14:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716110; cv=none; b=aTq80Aziy8cHywEIiur2BsIdnmn1f3Adadh/wyKebEbEHz3mBxOqzR/gwfQTUByCnwhCw+/UK+2aeKTnBZJ8qimuLRknK/8UhpK7g2v4EUxMj0ku/vICbOd33JFymF47eZQ9WKWV0L+uIWrjhyUNPVhmaUM0+CkdmUCblOAQlhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716110; c=relaxed/simple;
	bh=aD+lU3KqkIvxkzqfh3CtFvlRx9GYjQUJxwJWU93TxbA=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KIRTPHlMj+F9bPH3/7Fpx+vZCcTK8kQSy16/IPB6L5+sGgb8bm2L0uhdZEN4L4gCtFztcliGtnmWSWFpuquLUjnJrtqKdtGpMkJzWk0nmKDlPsQsAGb+w4ue6knORvSmVyGouzqE2E3NhEp5ax9YhDGv4Rs+DCJMhBAw9y5atCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=puGA7RUF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="puGA7RUF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0CB87408E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786716102; bh=0pQggVtbjFRCFaQGmg9pai0ViZG7UH99fC0jP43fc38=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=puGA7RUFjm9Qu2NZqOGvl2uFLTj07UAg50LengEx+0J1qqxilJ+eLVAgSYvCeCaHd
	 Qo02xaAmOYDqa7k94D4qtPifuSKc81tLMKGRG5YpU/kFgexdT5XYBOhGpZtT53+SpC
	 XdMYB3/pMbmfH4xgrYqHKQ8LsKN+S43Tat7qiwHjKbkGD8TxwDA1DcgD02qOHN43Jx
	 YpKhp2JobFS4ETvwnAC13sLnNrkwcPredgfUcvEpjAcYiybmTZQ4eS6DRnFLzDJz85
	 pYRK4Prn1uEqKOhfA4JIMW17zjo+mxLpQeTPO1d70So5jmwr7ARTbAe29ZHFAGjKWK
	 KSJL06nZiWuzw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0CB87408E1;
	Fri, 14 Aug 2026 14:01:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Manuel Ebner
 <manuelebnerli@mailbox.org>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ver_linux: add comparison with required version and
 colour to output
In-Reply-To: <20260814134931.2281085-2-manuelebnerli@mailbox.org>
References: <20260814134931.2281085-2-manuelebnerli@mailbox.org>
Date: Fri, 14 Aug 2026 08:01:41 -0600
Message-ID: <871pc0g5ru.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Add the required version from changes.rst.
> Add code for comparison and print in colour (blue, green, red) depending
> on the result of the comparison.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> I had this patch on my mind for more than half a year. I was convinced I
> couldn't do it because awk is such a special language. Took me less than
> an hour without AI - WTF
>
> Somehow I messed up the formating of the output. I guess it's this lines
> +		ofmt = "%-20s\t%s\n"
> but I couldn't figure it out :(
> ---
>  scripts/ver_linux | 109 +++++++++++++++++++++++++---------------------
>  1 file changed, 60 insertions(+), 49 deletions(-)

Honestly, I don't think this is going to go very far.

- You don't know that the output of the script is a terminal accepting
  ANSI escapes.

- You don't know if the user is running in light or dark mode

- Color blindness must be taken into account

If you really want to add this feature, you need to make it selectable
and configurable.  I honestly don't see that it would be worth it.

Thanks,

jon
