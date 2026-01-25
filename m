Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFE1405F7;
	Sun, 25 Jan 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354724; cv=none; b=bGpl4dmvzVTn82arZCmE2afed+8QxSvamBWQIWgGKoCpISzKIJ0R9Ub8WzYR0doHfPmt2SlK99IFuLVa9ZOF7HH6HBmPVmM9+YP5ZJmB9278PIAecXu03JVlSze52YsJ+YRk+lIGGNuwBmDZbTIQzdYpOzyVv8PLYood5FaHLmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354724; c=relaxed/simple;
	bh=oGESXLq/bWmrmAWbNt3J1d76zlCuhmDQVcTK8W6oOFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCtkLJSYq67wbDOjxc00+OQ7o9gzOkTD7ZR+gbtdCaNfGf5mTEfh1M7a1LmnVvQZfPAfEYAJ7RdkW4xB4xPikXciPNtuPj1prAuS1nnqvJDPiol/BsWmLwnD8HsDU1yxRenaTmGFjeH8dicEhqWKtGTf/xPdN4uDy4DCasFEJeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NNoIBjXl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NNoIBjXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D430BC4CEF1;
	Sun, 25 Jan 2026 15:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769354724;
	bh=oGESXLq/bWmrmAWbNt3J1d76zlCuhmDQVcTK8W6oOFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NNoIBjXltpIGrMiN5VVwB1k23p8IsghD+IPcCnz8QNi2pujpVQI6Ffke5F73/HbQ/
	 rThv3sHZJ2N2usoM2oCCiNf0pJ7NK8D98pDwcPT4HQVHiyi/BWKakSAInzXM5kO2FN
	 yYNhkxGtS9kgKSoSIdv+JK5kxrBmcUd/PZGbm2fo=
Date: Sun, 25 Jan 2026 16:25:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: john ashrith6 <johnashrith6@gmail.com>
Cc: workflows@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: clarify CC list guidance wording
Message-ID: <2026012527-operate-series-95f9@gregkh>
References: <CABoKZAD+694qPMAjgvJKfHdNYbwygsjp5NmowVA5hv63Z8823w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoKZAD+694qPMAjgvJKfHdNYbwygsjp5NmowVA5hv63Z8823w@mail.gmail.com>

On Sun, Jan 25, 2026 at 08:31:07PM +0530, john ashrith6 wrote:
> Removed the extra Signed-off-by so that only my real name remains.
> 
> Thanks for the review.
> 
> >From ed7f4bb8c6e46f76c1a02e91172402b7389ecb5d Mon Sep 17 00:00:00 2001
> From: John Ashrith <johnashrith6@gmail.com>
> Date: Sun, 25 Jan 2026 14:48:28 +0000
> Subject: [PATCH] docs: clarify CC list guidance wording
> 
> Signed-off-by: John Ashrith <johnashrith6@gmail.com>

Odd, this is showing up in a strange way.  Perhaps just use 'git
send-email' to send the patch out?

Also, you need some changelog text, for obvious reasons you don't want
us to take it without it.

Also, the versioning of the patch goes below the --- line, as the
documentation asks for.  Perhaps fix that up for v4?

thanks,

greg k-h
