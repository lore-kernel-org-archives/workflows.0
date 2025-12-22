Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EBD1A285;
	Mon, 22 Dec 2025 22:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766440919; cv=none; b=NTZ3OHiySS1Pj8ht7yVixUElWyeGMRIQy3QbLqDuCnXlnO3GjGQ26ZpowshshOEWtv6dtmBT/+eNo+1TWDf41XOtCsrJJmwu+bgjP1GfpC0PD+kgyeyo4USRxAZc+QdQuGeaPl8pOrtfeIi6G6frNPgiJVVgELrycB/juijta98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766440919; c=relaxed/simple;
	bh=m1QVUMeu7cjjFKBNNrg5Oh8fXASjEsrO+BPSw0qJ/q8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fKZKQKvx+vcmXUl71B1bnxZiQFKAWXxBkvH0uZ89Ccf5rOYi2uminRV9s0Yv+Vto+Rz+m0UpRZd3uEYF1v7ncDMw0dhkFNiPV0YXWA5NQXN7tmKKqub4S8o9tWhDUwJY5IyY42Pl+0Ja7+k9cjohsVXxTI8oxTokl8Dxt/ikyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=niRvO+39; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="niRvO+39"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C5CCE4040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766440918; bh=hrNzlMEzipfRavMUu3WOT9c1i/kNS++4suB4Qf+vO50=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=niRvO+39nYWvcWf4T3FC/tIqVVe+2hiP8hJicQmxkvuZdI1lqoCWXNWGVFtT74J1t
	 dzKnxrJ5kwOHHipICX9Mdd9wxKyh9dD+gK+4dMRHqkkkEbDwBMGKzLFMudQRfp2J/d
	 Ixccbk/hbASIi1SdXO61pKEd4bKZ3Lxj93nZn5k3W7mWJ0BaihxHU0GC20b9Onm/0B
	 LrYBU8zZsDXvcCEr3Lnp3OJ1wojjIrVOg1FuDrjai+kHtOtuKUyplVDhQB3lE2HKEa
	 qTBDqguAiepH8R8QrVISJ0F/xj9Fi/W2gICgtggeVluy4mYKmtoG+KnCIL70JyNLJl
	 /p1boLUzzJM/A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C5CCE4040B;
	Mon, 22 Dec 2025 22:01:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andi Shyti <andi.shyti@kernel.org>, Federico Vaga
 <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] Doc:it_IT: Do not reference kernel.h anymore
In-Reply-To: <klzag46p6mlqqdrogqofancqyjpvs5lmwa4m3tjszcgavdwa6s@nay2uuwpsvlt>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
 <20251205111559.3089219-1-andi.shyti@kernel.org>
 <zylu4ulxeyni5diwnp7o7evcajqyylhzzd4d2skyi2ul2ayb3b@2kojo3dyp2vi>
 <klzag46p6mlqqdrogqofancqyjpvs5lmwa4m3tjszcgavdwa6s@nay2uuwpsvlt>
Date: Mon, 22 Dec 2025 15:01:57 -0700
Message-ID: <87bjjq18h6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andi Shyti <andi.shyti@kernel.org> writes:

> Hi Federico,
>
>> >-Il file di intestazione include/linux/kernel.h contiene un certo numero
>> >-di macro che dovreste usare piuttosto che implementarne una qualche variante.
>> >-Per esempio, se dovete calcolare la lunghezza di un vettore, sfruttate la
>> >-macro:
>> >+I file header
>> 
>> In Italian, the correct name for "header file" is "file di intestazione".
>> Please, don't replace correct Italian with *Itanglese* :)
>
> I absolutely disagree.
>
> If you open any C book, they are called 'header files', except
> for a few Italian technical books with excessively literal
> translations, where even non-translatable terms are translated.

I'm unconvinced about "file di intestazione" based on my own
understanding of the language... but, in a case like this, I will defer
to the creator and maintainer of the translation.

Thanks,

jon
