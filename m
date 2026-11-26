Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795666101;
	b=jNiQeqFUJQnNqApuR6fc0nY+qxvtPeo+IkWDVdsn+KI3h2TKjtbvNoPvNVgBzTAAysoq
	 rYIcliH87znLScKtn41fphrguTxUrMzSZwSJIXMsWa4z3Rl5xBPfMWCOfnBAG4LNhAaSM
	 CanehisdX2zIzYWJIq0N8g00z7KdomC/evE7cp9OeIH8U8zhvZHkk0C/LcvbgzcAEbuOT
	 CYbHsfoB9Re92dN03aJEiYC8l4E6Wb5XEwtaCINuN5Fy+Agrscpl7dCpa5HRkGzmtoGnm
	 JGkqfHswvUdIru1uTIYO8UcdLP9NN9FGep6gKTK+4HGuB+h96XNMxtbFCc5y9AtBCaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795666101;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=A/WCX9ns4OZzkPHZYaGtM/ZtO5KmPPP2DkCJ4DMccZY=;
	b=tJ3R06ktKK4AYcm7riVVgnOv5ayxdKLcUO8DQiGYPTfBepBGiOdj6tSAETKqPjNGUno3
	 mfW1NXi9t0VGLUCCU7Sa6JBEbr05+6O/+8aJbTJwnC7uETv5nQJ/204C/bZkxwnwUzl1W
	 iBmO5YXnHdXB5JxXla+YKh0XLiA1RY/xxYiJSYWbV2h1cZD2F6OOJf99XGLZLd7Owv3Gi
	 6075Zul67dg9BuGxQ4+49PQJdIFZpYg82o2Oh4fxKAtpD14n/1M31XA+NW0wVt/sst9Io
	 VbFcMDui8pKvRaNFRYp97U3IEEm3DfDIyB7ZcVww6NuN3xIjarlNim7ywShecEJ2pNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b="i/HWQKP3";
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C218606A31E;
	Thu, 26 Nov 2026 04:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C218606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=i/HWQKP3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795666097; bh=A/WCX9ns4OZzkPHZYaGtM/ZtO5KmPPP2DkCJ4DMccZY=;
	h=From:Message-ID:From;
	b=i/HWQKP3/5jdI5ZB82HFB6sG2u80RJo1CIDti9LAYvqH0orfywC/wFu9oni+m2ouc
	 rCBMHf56JPGIhq3D32suPEW/wIYpatp6Ad+vcWCC7/xOQpY2s0iooXpTZ6dn7J7KQI
	 uQ5cFnfc6DkHdHsgdHHszms038XyuYH/iKDl6A3s=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 7B79FC0701;
	Thu, 26 Nov 2026 05:08:17 +0100 (CET)
Date: Thu, 26 Nov 2026 05:08:16 +0100
From: Willy Tarreau <w@1wt.eu>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, gregkh@linuxfoundation.org,
        Johan Hovold <johan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v2 06/14] docs: security-bugs: do not send archives or
 binary attachments
Message-ID: <awewsOJC0pUio_eH@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
 <20261114190014.17826-7-w@1wt.eu>
 <awdsPgHF6Y0xuSQI@archie.me>
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
In-Reply-To: <awdsPgHF6Y0xuSQI@archie.me>

On Thu, Nov 26, 2026 at 06:16:14AM +0700, Bagas Sanjaya wrote:
> On Sat, Nov 14, 2026 at 08:00:06PM +0100, Willy Tarreau wrote:
> >  Please send **plain text** emails without attachments where possible.
> >  It is much harder to have a context-quoted discussion about a complex
> > -issue if all the details are hidden away in attachments.  Think of it like a
> > +issue if all the details are hidden away in attachments. Archives (zip, tar,
> > +etc.), binary files and documents (PDF, etc.) are never acceptable: when a
> > +reproducer is too large to be placed in the message, attach its source files
> > +as plain text, and provide scripts that generate the required files (e.g. file
> > +system images) instead of the files themselves. Think of it like a
> >  :doc:`regular patch submission <../process/submitting-patches>`
> >  (even if you don't have a patch yet): describe the problem and impact, and
> >  list reproduction steps, all in plain text, then provide a proposed fix as
> 
> What if the issue can only be reproduced with specific binary files? Should I
> send it as e.g. ASCII-armored, OpenPGP-encrypted attachment or should I put
> it somewhere else on the Internet (as privately-accessed file) and share its
> link instead?

In this case what happens is that reporters ask us :-)  We're documenting
the rules to reduce the huge overload we're having due to imperfect report
that require a lot of extra work to process them, but the team remains made
of humans who adapt to each and every situation. We've had binary contents
in the past and if some are strictly necessary it will continue to happen.
The point is to avoid them as much as possible and prefer generation scripts
rather than images (especially for file systems which are produced with a
10-line script).

Willy
