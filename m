Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD1A3E9F8C;
	Tue, 20 Jan 2026 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912403; cv=none; b=IqYLl3to3uQJPMUheNf8smvc+4m95bdDj2lae7jzM8YzEUoeT9DHr2fhbDhumRjON1IC1QwUjb9x0fhq031y1EdrPHLxqATWIi/gvHxv3xc3B2WZrr01PrH2VFqBZk6j2Q9yX4fYDTW+723gYZuWZ4Icyqndr9iOh6jc4dCpxWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912403; c=relaxed/simple;
	bh=vBeuKkhx08aIyCc74TwTeuXznJnOvHq1xarlmMfLtbg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dQImNDW0AjOJQAJicbAnueX2S3x1mdUzszf3I17XxLdTYcSg7Yh0XtUGg6XxA2gk88Pn9gf5l1Spem/uCL6YtvEshRB8UJJyqhwns+QLE41HSb8a3HXwipba7vKz5qDCf1xpcXCN5aqnGnwrhjhwL6QKWjoytqmtSCM+Nr79pBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=bMAruVCF; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="bMAruVCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GSlYyMNPyo3nTygPcryodFS1sqXZdlseWzX9iuCJUy0=;
  b=bMAruVCFNUKc6qCht4t2XhuloNnw6BwecFuJ1+qcDa9bEPOswyDQLusw
   a3Q2JNAFEIRSNecBPUVPK0CYdVNXSKreNnu4RbSdybnNHAeFRE0K7rsKA
   eIwL7U5+NCLQVUt0hQWdpJ+UKfhrGbtuEn52sR392SHgpJjCz+nE4esxz
   Q=;
X-CSE-ConnectionGUID: F+ym4SO7RgyYZhvhYKVWZA==
X-CSE-MsgGUID: C4kPhhLYR06hOY4KseEzbA==
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.21,240,1763420400"; 
   d="scan'208";a="136504220"
Received: from unknown (HELO hadrien) ([4.26.64.170])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 13:32:07 +0100
Date: Tue, 20 Jan 2026 07:32:06 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Benjamin Philip <benjamin.philip495@gmail.com>
cc: Julia Lawall <Julia.Lawall@inria.fr>, 
    Nicolas Palix <nicolas.palix@imag.fr>, Jonathan Corbet <corbet@lwn.net>, 
    cocci@inria.fr, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [cocci] [PATCH RESEND 0/3] scripts: coccicheck: document debug
 log handling
In-Reply-To: <20260106190836.36630-1-benjamin.philip495@gmail.com>
Message-ID: <699831d6-694b-5435-5afc-c86e5a815a61@inria.fr>
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
>
> Benjamin Philip (3):
>   scripts: coccicheck: simplify debug file handling
>   scripts: coccicheck: warn on unset debug file
>   Documentation: Coccinelle: document debug log handling
>
>  Documentation/dev-tools/coccinelle.rst | 21 ++++++++++++++++-----
>  scripts/coccicheck                     | 21 +++++++++++++--------
>  2 files changed, 29 insertions(+), 13 deletions(-)

Thanks for the update.  I will try to get this in for the next release.

julia
