Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367BD23643F;
	Sat, 21 Feb 2026 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771692108; cv=none; b=GTIW4z4U12Eacm/nd/7oLF2nwnOM1L2c+MdAFAy0wH2PJ4LmHT7Sse87PfkazzYGYqO4lFB4LPWuNfVzg3FsYdiexOm2Ym9S/X2GmNZ+lAhEUjSKM3YxstKQa6B8oW/aISHS9h+1+Kx2KKDLSdo7PqdnFq2hixQq9fmk+zWkNCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771692108; c=relaxed/simple;
	bh=ab9k+FViLxYiGa6HUAKp6E8heaHxscWcvE3m3wPCFTM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DB4IL0jy5g24KScoEObBZu6G+XVbzsUKjMabhoo+U+ui/MkXKqY7/UuilEQxf8nRe0n1/2OIoNimyn1WnrViibBmaRly2r3wGcUxWF/pVWNGyCMe8OBJlW8+xyhevEZJuk5gLxtGcyJQDN6JAtTYzoDsFL94KFB5owQeEUmLDt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=pXaVrPyO; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="pXaVrPyO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0E0cRYqijrCwJh0X9loWN0ExmdDOCjZ4/52FX0z2YyY=;
  b=pXaVrPyOzLVeVMa+pkGOMDtqSUGLNrU7++EZvkBD/1eJBgsCV0dN1B/h
   WWVN3elRD8SDZ8VxuxS83EXK7CsJO4QSAIfGD82FW1XCieD52tEv3/XuU
   0T63PMSc5WjKQtOImXnsrHQ08ltW0rpzwkc112UMdv3TukZxAdeel1nLW
   8=;
X-CSE-ConnectionGUID: XshNDX13RiGDrwkmXEs6Uw==
X-CSE-MsgGUID: H9TCGdPvS/WbwM0UP93BxQ==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,304,1763420400"; 
   d="scan'208";a="139448696"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 17:40:34 +0100
Date: Sat, 21 Feb 2026 17:40:33 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Benjamin Philip <benjamin.philip495@gmail.com>
cc: Julia Lawall <Julia.Lawall@inria.fr>, 
    Nicolas Palix <nicolas.palix@imag.fr>, Jonathan Corbet <corbet@lwn.net>, 
    cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [cocci] [PATCH RESEND 0/3] scripts: coccicheck: document debug
 log handling
In-Reply-To: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Message-ID: <905ec76f-027-c71-5154-76d8c4e7dbc8@inria.fr>
References: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 7 Jan 2026, Benjamin Philip wrote:

> Currently coccicheck prints debug logs to stdout unless a debug file has been
> set. This makes it hard to read coccinelle's suggested changes, especially for
> someone new to coccicheck.
>
> This patchset documents this behaviour in both the coccicheck script as well as
> in the dev-tools documentation. Additionally, it simplifies some of the logic
> for handling debug files.

All applied, thanks.

julia

>
> Benjamin Philip (3):
>   scripts: coccicheck: simplify debug file handling
>   scripts: coccicheck: warn on unset debug file
>   Documentation: Coccinelle: document debug log handling
>
>  Documentation/dev-tools/coccinelle.rst | 21 ++++++++++++++++-----
>  scripts/coccicheck                     | 21 +++++++++++++--------
>  2 files changed, 29 insertions(+), 13 deletions(-)
>
> --
> 2.52.0
>
>
