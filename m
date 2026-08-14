Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC1748C8DC;
	Fri, 14 Aug 2026 18:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786733189; cv=none; b=ZRTi36g/NL/NwCXmz+fNMGqLjbkQkrywhGWS6wSzZltjZFn8pknhT4aTfuDxJDkDKRl6i37i8pM/jp8L/+MLucXOto+/35cJ1RS/CIvwKYrSWMixkKSv0PCd7aZ4pcOjcIy5hx/lynV04Zs3EF53LNke7+MssBi/V7KDmbCqMI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786733189; c=relaxed/simple;
	bh=xUtLjTTrCAXEQsdA+pDs4Y+a6pRoNMTeoC+mabb5u6s=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B+W7BNCpTrGokzm0l84M2hHbtE+YCImUg4AHxGrNBPMXkAVkbBqRVglezZTLD78vymMY/iRYOP/HYCuoccn4Cf+qPpSK5+ei5ZXewlfMxC3KtwN8R9i9xPCpIFbAekxjSGnMzJ8O39UEcYTkT3kXlDFCl/lRJPJEWQxgy3dGQDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CDOUEsSQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CDOUEsSQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6FA62408BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786733187; bh=xRUY8DahbixUkZpWMkvoO7p6w8QgrNGFT67ILUadYC0=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=CDOUEsSQWtvFi9SYSfIaYLk6mw91kfYQkDYFq0hM8/BJJinNpFBH8tBYOy6s550sX
	 Wahshrs5AjZPuhdermr2uyuDJVgay56msnHRWOY9etdciLEhM51a26IIiHZ/ryKhou
	 e2Rg406yCZI1fm6mEPnSC4EWynDoHtuAQXsGuLOrUSR3cEKVwjJKzF07I0cGic5SnU
	 7faD1kQTvfGYUYUxiRJrXVpmdHyJWS5++K1b5yn1Vgq/mwBKNaHtzKaDbDQ7YGm69+
	 AsqJ7/2WVidpWgiN3ukDMTFB7Q+RB+4ydIM0L8MuG18TMFbpx309NdLUUOLt4eoTvz
	 lviDzEJjNo4oA==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6FA62408BB;
	Fri, 14 Aug 2026 18:46:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Manuel Ebner
 <manuelebnerli@mailbox.org>, Shuah Khan <skhan@linuxfoundation.org>,
 workflows@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] ver_linux: add comparison with required version and
 add rows and colour to output
In-Reply-To: <20260814143212.2288631-2-manuelebnerli@mailbox.org>
References: <20260814143212.2288631-2-manuelebnerli@mailbox.org>
Date: Fri, 14 Aug 2026 12:46:26 -0600
Message-ID: <87o6f4ee0t.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Add the required version from changes.rst.
> Add code for comparison and print '###' in the respective row (good, bad) and in
> the respective colour (blue, green, red) depending on the result of the comparison.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> [v2]
> add colour reset as Geert suggested
> change output to take colourblindness into account

So that suggests you read my previous comments, but didn't see fit to
look at all of them or respond.

*How* are you taking colorblindness into account?  Which type of
colorblindness have you tried to address.  Certainly not red/green
which, I believe, is the most common form.

But, more to the point:

- You do not know that your output is going to a terminal at all, much
  less one that understands these escape sequences.

- You do not know whether that terminal, if it exists, is in dark mode
  or not.

- You don't check NO_COLOR to see whether the user has explicitly asked
  to not have colorized output.

This is a simple script meant to check dependencies, it really does not
need this kind of silliness.  Surely there is something more useful you
could work on?

jon
