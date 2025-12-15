Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92632F6586;
	Mon, 15 Dec 2025 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765815247; cv=none; b=Lzkd89fNN6nJ0Iry1WOL3wbDUP2GdV3GOKRip8gFTOrYiGx6gkclK+GcWuY4ak3gxByQpSSupnbFm4hsrsxPSExwTbtfFlWIJAzzMyrviaDlxGYjoHANOpQ7Qj7qZcDVOLX18SB1xp5ronGUu3PLg6+oWWZCPltmruAzM/s2K7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765815247; c=relaxed/simple;
	bh=JScDCS1H+r/WP42FwfX0EMpnnIOSKBXIxXlupHu6SaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TYvTUWLuIVAD22PHwe8eecGWYe97JWU4x1hkIKmUOzsu0oGMWOZBsaeVjLfXaEpXKERXbAnAWlzw95U4YwcYBQ3ieyYBuPqVr2Mp/ZPYlKscP2Xf9Vc/Pkc6CPM3UztjUOcOfe6KNpVyvr8suwdVLtdvwm48BLtGifmdw8UdE7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBsao/Pj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBsao/Pj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63435C4CEF5;
	Mon, 15 Dec 2025 16:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765815247;
	bh=JScDCS1H+r/WP42FwfX0EMpnnIOSKBXIxXlupHu6SaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fBsao/PjuAB/vyKpHqOhNL7MJdCvXk2vsev7NNDT/8ljyG6gdbI8G5HTLR6du8px+
	 IlQVDMkuu9wvbVSqnMNdnDcTcScuhXr6AkJLg+QXUwl9bUs4LteBHcIdDd8ESmWmyN
	 /+Ud1ZeErjbloHFFhMakd6KQNDOWbo2X3Jc/JJXRkXe2ImA+ZPoDL+ZISg1ge+AoT7
	 4sBZojp3cfN21/ctiFgJcz0WI+0DI4JwsZjY7iyqnHQyfcXnEmj/5I/L2a9pWmKgJY
	 bMgdVmvJhp/sLIZftZqsA/CM7+uTM2TXcnhZ7wsp6Hf/RoB1icAM6S1Gs5PKySjy6c
	 VsN8n/qyDayxg==
Date: Mon, 15 Dec 2025 17:14:02 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] Doc:it_IT: Do not reference kernel.h anymore
Message-ID: <klzag46p6mlqqdrogqofancqyjpvs5lmwa4m3tjszcgavdwa6s@nay2uuwpsvlt>
References: <20251126214709.2322314-1-andriy.shevchenko@linux.intel.com>
 <20251205111559.3089219-1-andi.shyti@kernel.org>
 <zylu4ulxeyni5diwnp7o7evcajqyylhzzd4d2skyi2ul2ayb3b@2kojo3dyp2vi>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <zylu4ulxeyni5diwnp7o7evcajqyylhzzd4d2skyi2ul2ayb3b@2kojo3dyp2vi>

Hi Federico,

> >-Il file di intestazione include/linux/kernel.h contiene un certo numero
> >-di macro che dovreste usare piuttosto che implementarne una qualche variante.
> >-Per esempio, se dovete calcolare la lunghezza di un vettore, sfruttate la
> >-macro:
> >+I file header
> 
> In Italian, the correct name for "header file" is "file di intestazione".
> Please, don't replace correct Italian with *Itanglese* :)

I absolutely disagree.

If you open any C book, they are called 'header files', except
for a few Italian technical books with excessively literal
translations, where even non-translatable terms are translated.

Italian technical translations usually preserve the original
English terms as much as possible, which is quite different from
what often happens in French or German.

'File di intestazione' is a literal word-by-word translation.
If you want the proper technical term, it is 'header file'.

> >presenti in include/linux mettono a disposizione numerose macro
> >+che è preferibile utilizzare, evitando di sviluppare implementazioni
> >+alternative.
> 
> I think it is less accurate. In English, it tells users what they "should do"
> and "should not do". It does not speak about what is preferable and what to
> avoid. I agree that, at the end of the day, one should come at the same
> conclusions. However, the translation should be as accurate as possible and
> make adaptations wherever necessary to improve the understanding.
> 
> A would be perfectly fine if also the English statement changes in the same
> direction.

I think a literal translation is not beneficial to the final
text, and we have some room to rephrase it while keeping the
original meaning intact.

Andi
