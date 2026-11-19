Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091814;
	b=mgLzV/HWnc95eKLyhz31zf0b8Lf7Fy+eZMxTlWFi7LComfiAEV1xr6dWxM63Pd9rz4DH
	 /GWHZp/AxwIQPKXCNIIdqOM8B96GWgmU+8gW7BZSHRj8DrjFc85LPuP5rR9QtY39+T96f
	 F+NiiuBnqUPl8jiRAzuu26Hr2auQsOYg60hODvbznBup3EMoYiagEWsFLN9prK+JMAroO
	 FelPi9wbv8LNxieotNGypK3PuB4v4KDjHeFSLKeqo+eN84dh4K77zQt+IShBmoUwVZJbO
	 nUxc2VlbQm9GG4PMlxfR0C3n54kXXoTGFUZL0KqmzBi4j4NuV+3oGMEJuS8MXo2Oyww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091814;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=D3gc3lBIRXAtYhYG5AflsZ19kHb6SmB3Pp22CiAOTFA=;
	b=GxIJ7YE/kowLmS5U3H75LyLevMgRjcUGsXPBL3B4WJkSV107q9JfLpvqHj1FPKc+h9eZ
	 LMd7a8YZF4aQStgw7h4fyUw2Qca5v/mwwYnwFA/CqYmu+qGbecMWXZrf8leFiq6HsKViY
	 v9Dk0vcKE68l1eaf8mcFhpRXFaYEWjTkarxJhXgFa8Ks8rQD0awo3YUjlPa6X+sA1EJKG
	 uR6CCfJD0WsrWM9hmZy0qdPdthT46RGtocOaVsq8grlWLSeF/8se0k+N0enRskhCeJJ/P
	 hkVz+o4HtFSDBAnG8RpE20iqQscrJdURMOXNWwecvpOXuTZznIdhAOutJ7HIKZPIusQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=Vl6sJpUh;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80D5606A32F;
	Thu, 19 Nov 2026 12:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E80D5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=Vl6sJpUh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795091811; bh=D3gc3lBIRXAtYhYG5AflsZ19kHb6SmB3Pp22CiAOTFA=;
	h=From:Message-ID:From;
	b=Vl6sJpUhq5TdIupxtFNHscDA7VJtSC20Olg9+YkwnecXB6iWaXkR48Wg8YOcZ0ioi
	 7EVmcD41qtqg5bbIOA7BJmk2/1yy56e/XwxdmNvUDaqwPeLlfmJGUnD264s4hE4+wF
	 5r1ds+4QPMqshRR9ZJbFal1LuCo8cPh0Zqmnqw3M=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id C53A8C04AD;
	Thu, 19 Nov 2026 13:36:51 +0100 (CET)
Date: Thu, 19 Nov 2026 13:36:51 +0100
From: Willy Tarreau <w@1wt.eu>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, Sasha Levin <sashal@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>, David Hildenbrand <david@kernel.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: ask bug fixes for their
 user-visible impact
Message-ID: <av7tY64O34gbJvH_@1wt.eu>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
 <20261119111902.GH162713@unreal>
 <04ff90ba-296a-4618-9d25-390f84f856ae@kernel.org>
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
In-Reply-To: <04ff90ba-296a-4618-9d25-390f84f856ae@kernel.org>

On Thu, Nov 19, 2026 at 01:04:32PM +0100, Krzysztof Kozlowski wrote:
> On 19/11/2026 12:19, Leon Romanovsky wrote:
> > On Thu, Nov 19, 2026 at 11:13:57AM +0100, Krzysztof Kozlowski wrote:
> >>>> v1: https://lore.kernel.org/r/20261116191436.188098-1-sashal@kernel.org
> >>>>
> >>>>  Documentation/process/coding-assistants.rst  |  6 +++--
> >>>>  Documentation/process/submitting-patches.rst | 23 ++++++++++++++++++++
> >>>>  2 files changed, 27 insertions(+), 2 deletions(-)
> >>>
> >>> Sasha,
> >>>
> >>> Since you're already making changes in that area, could you add a sentence
> >>> asking reporters to provide the full dmesg stack trace?
> >>
> >> If so, then trimmed. We do not need all addresses and registers and the
> >> [time markers], but rather the calltrace from decode_stacktrace.sh.
> > 
> > Regarding time markers, I agree. However, addresses are an important part of
> > debugging information. These bugs are rare, but addresses are still useful for
> > identifying incorrect pointer arithmetic or pointer assignments.
> 
> Depending on the case, e.g. some driver lockdep reports don't need them.
> NULL ptr usually as well. The point is that dmesg should be trimmed to
> relevant and useful information. If that includes addresses for that
> particular case, then of course these should stay. But 75% of data here
> in commit like 5b4bd13e0552926648a46c2c9a12a24dfaee3715 is not really
> helping. In the same time undecoded call trace is useless, because these
> addresses depends on the build. The dmesg should simply be the decoded
> stacktrace ONLY for this case.

Then just the 2-3 lines capture inline, and the full log attached could
please everyone ?

Willy
