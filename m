Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807841;
	b=LpEua3SlupPkZjPvrSse8kddP1FKpPMtdOTvV67fxSKbj53lrzXO+v5NdDt30FEaZjMR
	 odt1twscYiScWy0aPwH/P5M7Q9xf59571XXu5p7CTOie5MbcXpTtUfGrLJ7N9XThq4yuY
	 maXUVBy1qYVjVaJGgvZBsVcAJYOm0QpQr+ps6yLNbJcPOCbM7N85jvH6k+dzjVpLW6Xyt
	 MURdC481vNbZrzOuuR/5G42RksG6Q6ZeE7I20UpSMIzvLupLH/n1DoETRTr1ygRpoXiEI
	 pXXh1l07FuiZzreCEr4b5ukYrOk+CDCsrfWO8ikUVbug0Gzc/KKZIKfk+Seq7v0ujsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807841;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=iD1q/YnjhYedhi3wpttxm15pfiamViQA6OVffATVlFg=;
	b=ONHjNT3h4hvDRXkHQ/w4r+vOuQxpe7VjEOtdOi5NiNBJz0tFDEoMlNiraTGVjhbUIwwg
	 knCai4fVl7CQjC+xBgLa+rq4/kIZsFDnLEgpPs4xff615tYl11RyA1NF7s+jGtoadMuh9
	 Lh1O55fU+eH4wHXm7wivpSF0+EFcswGeFtDM4DRJRMQtoNdrQCuNOw4KjoIUazkmJR89L
	 kcFAL4t8LVb3Pyp/xxB7ZfV2w/wyTODEsiIecjyxlRdvwBu6fxmZphuzc+kmOo0r1adXz
	 EOBOGxapCkqh4fs+9WVfQzTuQDObUcRjSQ3MMfUloZKpNpUqLl8LPAK4G6yJkD63Hrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hDvWBZ+2;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B50606A31F;
	Fri, 27 Nov 2026 19:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B50606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hDvWBZ+2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=iD1q/YnjhYedhi3wpttxm15pfiamViQA6OVffATVlFg=; b=hDvWBZ+20vAXxeg2+JLiA783lN
	MQ5bItrlA/smfP7a+APfi77vXSA45z1DIdQKi5ogMwkh1qHn95ZYEUS7nYBBDo5LYZNhXlKSQw97Q
	quXdhEXQKp5vSnVPYeDBqHHGfcgDA9gqakGN8qG0W7JyuAWxym5+W3BhfmUaUh4nTXrGtQ70q2Jyf
	NReoZt2CGg6X8RiUJw1b11lgzd0w+JR1YsoV4DFMwmOMuD9kTKP4tCn9+A82ZesfAQpTu84GeZw0Q
	iR0wYSrW7o/V+F/0Kk4Edk7R5Odk98/5+s1Z6xkOqq39+noFVd1mzvOH33YB/+4mSMHf3AanIuZPe
	1f3pYl4Q==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1eM-0000000HYhY-1Eaa;
	Fri, 27 Nov 2026 19:30:26 +0000
Date: Fri, 27 Nov 2026 14:30:23 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: Sasha Levin <sashal@kernel.org>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, 
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Willy Tarreau <w@1wt.eu>, Borislav Petkov <bp@alien8.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Marc Zyngier <maz@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Hans de Goede <hansg@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Jonathan Cameron <jic23@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Theodore Ts'o <tytso@mit.edu>, 
	Security Officers <security@kernel.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] docs: coding-assistants: ask for short changelogs
 and a cover letter
Message-ID: <iesgqewdy4dou4owj5lhgfq23jcydmvs32qdgil6cklt4br667@bfvlauc3jyen>
References: <awlNYsu1y8EhYgor@1wt.eu>
 <33c6cf3a-6b18-4e09-bd5c-68ed2c34de56@kernel.org>
 <awlR9pQUjodcLjZK@gremlin>
 <20261127133756.455469-1-sashal@kernel.org>
 <awmJ2c87NSDjtSwp@gremlin>
 <20261127143124.1039470-1-sashal@kernel.org>
 <33de19df-1729-4d1c-a6ce-e10e240e0c57@kernel.org>
 <20261127180325.2304501-1-sashal@kernel.org>
 <61b33977-7c05-4d30-9a78-8fc711bd95ef@kernel.org>
 <20261127182602.2521454-1-sashal@kernel.org>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127182602.2521454-1-sashal@kernel.org>

On 26/11/27 01:26PM, Sasha Levin wrote:
> On Fri, Nov 27, 2026 at 07:14:03PM +0100, Vlastimil Babka (SUSE) wrote:
> >Ugh I'm not sure about inventing a new placement. Rather focus on that not
> >being a wall of text in the first place? Because it really shouldn't be.
> 
> The part that's hard to keep short is the logs. Leon had an example in the
> other thread [1]: the patch came with a three line KASAN snippet, and only the
> full dmesg the submitter ended up sending [2] showed that the crash came from
> an out-of-tree module written to provoke it. That dmesg was 904 lines.
> 
> It sounds like a bit much for something under the scissor line.
> 
> [1] https://lore.kernel.org/all/20261125125739.GA14811@unreal/
> [2] https://lore.kernel.org/all/20261122103855.51859-1-lee@jaeyeong.cc/

I find it hard to understand your point here, Sasha.

Are you saying we need to invent a new placement because there was a
dmesg wall of text with details buried in there that might have been
overlooked?

I don't think accepting a wall of text will solve that particular
problem, but it is currently why more reviewers are quitting.

Thanks,
Liam

