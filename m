Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109A21FA8DE;
	Tue, 14 Jan 2025 19:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882806; cv=none; b=p94G9PkqNXo141fRsJXVehJ+wA+dD31K/dJaGk/kioHs7kmX45JhYQttOsHF3MvNudFeKHbl+xU/KSurAjD9Gm1vqFf4PoqkZeD5SITG8VnRWpHWkvcBTavFWDrGstgS/G+S27YFNMeeAwXLmCba5ImVllQ8SGb2V7LN4znjR4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882806; c=relaxed/simple;
	bh=SK7zaQhzK6CqO740ImEX+obJ8NEDbKr9dBwvLg2Cn3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQmkhrUWYCyFLtZLr0RGlpBLZKU2wopuCgD5TmQilBbg7Z0vyxQjO3600GENYdILn+Qa77IQsrQFyzW9Do49zNjoieXmBwZTJ6lHzEnJh7M+8r79M72vGlo9nb38LIqIMJK+5Rstu/pLnMC7Fvgmu96spoRc0hWckkpB3fSGHsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z3bO2PPp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z3bO2PPp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7850DC4CEDD;
	Tue, 14 Jan 2025 19:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736882805;
	bh=SK7zaQhzK6CqO740ImEX+obJ8NEDbKr9dBwvLg2Cn3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z3bO2PPp+YNwEwVWSzILtQSwN17gNKZCaIzFR+AugKr3v4otcVx2rIlHUhKcI0tsu
	 rIDfAb5VwTJ1BQCCw4eDYBkA1LZ7S7TGEyXyQp/czUgx8WNOeBo2DhOUT8SseIgr8B
	 HF4QYcCaJ6HOxWHWQY9Xw4JvU/qxVWNDoSFNvMDk=
Date: Tue, 14 Jan 2025 14:26:44 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] checkpatch: Add support for Checkpatch-ignore patch
 footer
Message-ID: <20250114-olivine-adder-of-weather-1eaabf@meerkat>
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
 <20250113-checkpatch-ignore-v1-1-63a7a740f568@google.com>
 <5abiddu5zgxdmotauxnohnk25zyzd3cbjlfgskejk5ta7arzk2@pjpofoy7pcce>
 <CA+i-1C1WF1cSvcNABGRbg34_aaOnSoVoDNBR357q8rrGk52OPQ@mail.gmail.com>
 <20250114-tapir-of-splendid-leadership-ad115e@lemur>
 <CA+i-1C2OrLDvp_xiomc_B96vZu8G8KRrg7KBHATz2y7KMO8UsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+i-1C2OrLDvp_xiomc_B96vZu8G8KRrg7KBHATz2y7KMO8UsA@mail.gmail.com>

On Tue, Jan 14, 2025 at 07:29:14PM +0100, Brendan Jackman wrote:
> > Tweaks aimed at checkpatch are only useful during the code review stage, so
> > once that code is accepted upstream, they become wholly irrelevant. A
> > checkpatch trailer in the permanent commit record serves no purpose, not even
> > a historical one.
> 
> Yeah that's a good argument for them being unnecessary. It's not clear
> why them persisting beyond their useful lifetime would be a problem
> though. Any given reader of a commit message is already very likely to
> see tags they don't care about in that moment, is that something
> people really complain about?

Yes, I expect Linus will reject commits that carry that trailer on the exact
grounds that I brought up. He stated multiple times that a commit message
should only carry trailers that explain the context and the reason for that
change.

-K
