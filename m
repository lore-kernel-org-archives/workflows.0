Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6083D364933;
	Mon,  3 Aug 2026 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785774280; cv=none; b=ANKbzP0keODwwiCATuX9p8eBuy5oqFyzsT8k6L5Za1m9tLeb2CAO6Avsfvjjb+K6ad1/synlgGUxlyjhAZThjonULBqo05jFpSFk82k7KG75673r9O+5eFl5eA2S5oiHtim0mTMj0kkS/VjWDMJfQ7bFjc60aLPwtC+v8Ekkr4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785774280; c=relaxed/simple;
	bh=Noa2EcjPYEHob/iew68Dk81/4qIT4EPwVJTPZwig/QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdUBJmxLX0rk7oBhixv8GZutSwjlt3ovIrUJfLcEOCD2AiCwjAorFiQ6l9m9tHxcSsXI/OB0pnDzf8tgLQx/TTmkZvEo16YoKvh2lhycfKKHEewJhdPmn2w7QcLrXMiKARJElp3oEgOjcUV2gNvYmzmppYZExHH8WDmQwhoTkwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=pd1JZ/tX; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="pd1JZ/tX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1785774273; bh=zwHfI9fsRI2U2aVp1OZFk7kTR9BsljVvynCweb/hgTA=;
	h=From:Message-ID:From;
	b=pd1JZ/tXlvfD/P1qCjCxzzhcNMzjWV3Aie+ARfJGrkmjDITZWcWwVIEEYxOwPqN3D
	 hB/iglP/xllMRsmQPIpfjM1+99+g9zubJhwhqzdmeboiV3q3+Ezgx133w6P0UMP0Wk
	 uxqJMaV8lSGpjkXfUsfJy++fLWNKt467+M2EPPDU=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 069BDC0A40;
	Mon, 03 Aug 2026 18:24:33 +0200 (CEST)
Date: Mon, 3 Aug 2026 18:24:32 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: greg@kroah.com, security@kernel.org, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] docs: improve guidance for AI-assisted bug reports
Message-ID: <anDAwIcyU-KfCqMT@1wt.eu>
References: <20260802203540.3453-1-w@1wt.eu>
 <87a4r318h0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4r318h0.fsf@trenco.lwn.net>

On Mon, Aug 03, 2026 at 10:20:43AM -0600, Jonathan Corbet wrote:
> Willy Tarreau <w@1wt.eu> writes:
> 
> > While vulnerability reporters have now started CCing maintainers,
> > showing they read the docs, the security team still spends a lot of
> > time repeating the same comments about tested version, incomplete
> > fixes, poor email client setup causing formatting issues making
> > patches unusable, unverified reports and missing Assisted-By tags,
> > each time for AI-assisted reports.
> >
> > This series adds small updates to security-bugs.rst, threat-model.rst
> > and coding-assistant.rst to better deal with this and provide minimal
> > instructions helping the LLM follow our expectations.
> >
> > The updates were iteratively and carefully tested with 3 models,
> > Opus-5, Qwen3.6-27B-Architect-Polaris2-Fable-B-F451, and Gemini,
> > until all of them strictly followed the rules.
> >
> > It is expected to further improve the situation.
> 
> Just FWIW I've read through these and can't really find anything to
> complain about.  It looks like Greg is planning to pick them up, so I'll
> not do anything with them unless instructed otherwise.

OK, many thanks to you both for the quick response!
Willy
