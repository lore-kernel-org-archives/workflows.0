Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093117;
	b=fUnLjoJpqP9oF+vqRRJeYfWx9WqVUSR4fWDqT6ZQceaGpNNKwNfjCnglV/0B9ObCqqA8
	 pUOGLpLs/sFl8TyFx4pZtfhGV0hmMWeO4xi4swXf37T8fdgwr4ZIloHjmo4xfcv+FX+cl
	 Uq/GL26li4nXpFlxk/ABcFXfoISaafyJMvFCvvTFrjSbIJn+bSMK0LdwjjQ9YtDfN9lpz
	 VtteReZJKEc8id/+7lnF6IO4a6uxUOlBYV7leMs8vOcAhTdwQl/xQro4VAnSdrZDbhr16
	 ey5gi3tckTvWLbK9bTbIiII/3XiZGn6Vsr23oIKvjL6I6r/J8ajRBBusSiWd7xt/M8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093117;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9H7FU5wufj4aReCnTZ7JSBBTTSjGmGWvitWlpdHv45Q=;
	b=Qnmja9VgJuSlp5W+VfL/zMsfsT95E0oUmra6+zQ04ykl29u0YrbgcNgRbMz0PY2THHWr
	 YyecCkTU+6qLTe8zM+AOzXnp2gvBU6KqF0zbM98+UhdWpxCqb7eKXgBPDHPKGwn16Hfxv
	 dTpG2QX+bCyYi/23C3uE/kReBOp9T11odQzv4KUeX9L8S/O+CQEwWwH6NQv9q6nYAcfPj
	 BlhO3Wx8g5UlHqUofWVNDLByhgcXtHkobNlZxGcMAEIvM27ilM/54BWHCpyKcZh1PEdiC
	 QWerjr5OoUFJ/jsrVZUai2gl3+cY+NWkqgaa2vRn1AbujaAnvTfMTlYXHuE5pburv8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=MD7J2t45;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D2606A320;
	Thu, 19 Nov 2026 12:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 401D2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=MD7J2t45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1795093113; bh=9H7FU5wufj4aReCnTZ7JSBBTTSjGmGWvitWlpdHv45Q=;
	h=From:Message-ID:From;
	b=MD7J2t45CIions2sUaklKxtVmNR8s4Tu2W1DwCuLlKsls5UPQOR5sZyXbfEDFOlxH
	 6Adepr6489jc80vj2RL8pc/j+7tYwS4g/dLlKPtaORaqLLmGOc9naVIG3D2X8znb2U
	 9qtaJwb+R6cfzVbko6NWSJZnnLpBdp82tFmAPpZw=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id D4EA1C04AD;
	Thu, 19 Nov 2026 13:58:33 +0100 (CET)
Date: Thu, 19 Nov 2026 13:58:33 +0100
From: Willy Tarreau <w@1wt.eu>
To: Leon Romanovsky <leon@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
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
Message-ID: <av7yeZewupqBXNEy@1wt.eu>
References: <20261116200515.352387-1-sashal@kernel.org>
 <20261117092723.GA124972@unreal>
 <220c5818-ad59-4003-9955-9821d09c0279@kernel.org>
 <20261119111902.GH162713@unreal>
 <04ff90ba-296a-4618-9d25-390f84f856ae@kernel.org>
 <av7tY64O34gbJvH_@1wt.eu>
 <20261119125450.GJ162713@unreal>
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
In-Reply-To: <20261119125450.GJ162713@unreal>

On Thu, Nov 19, 2026 at 02:54:50PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 19, 2026 at 01:36:51PM +0100, Willy Tarreau wrote:
> > On Thu, Nov 19, 2026 at 01:04:32PM +0100, Krzysztof Kozlowski wrote:
(...)
> > > Depending on the case, e.g. some driver lockdep reports don't need them.
> > > NULL ptr usually as well. The point is that dmesg should be trimmed to
> > > relevant and useful information. If that includes addresses for that
> > > particular case, then of course these should stay. But 75% of data here
> > > in commit like 5b4bd13e0552926648a46c2c9a12a24dfaee3715 is not really
> > > helping. In the same time undecoded call trace is useless, because these
> > > addresses depends on the build. The dmesg should simply be the decoded
> > > stacktrace ONLY for this case.
> > 
> > Then just the 2-3 lines capture inline, and the full log attached could
> > please everyone ?
> 
> I don't think so, because this information is also important to preserve in the
> Git history. I received offline feedback that the full stack is useful for
> backporting and customer support, too. Sometimes the dmesg output is similar
> enough to recognize, but differs in two or three lines.

Good point and several times as a user facing an bugs I've looked for
messages in history as well before asking for help.

> I welcome AI-generated patches, but they should not be trusted blindly.
> I also don't believe AI can reliably trim stack traces.

Never trusted indeed, however running "sed -n first,last,p" is now quite
common and reliable since the LLM generates the extraction/trimming command,
not the contents anymore.

Willy
