Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EEA322A28;
	Sun, 25 Jan 2026 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769351964; cv=none; b=UvXjVUeQMPNbFqqmVWTGZdQC6U9Id7UCrBhyPlJ1QfhRfjr6fpjui0G+wuZggbRm52qbiVzpYv50cJrqdbGUSFSTbChj7oXDFBf9xtHcxbjrCVIVwmlLo6/BTAUR+n6JqZAglhkV1NpMhLD9q7P5yKP25cAFpZmrMp1wSSweIoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769351964; c=relaxed/simple;
	bh=ul3zI6m3/E/j0CtfDBenVrsXomXj71j6tkFREgyaXoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohNbubn7OnhAyFA/MvH4sMnVfJyhhu2O6FbFEh0tOWMlFQCi0sRMg4eIyWYH/DnfeftESntlqYTKFDbO+wWo6ZRT9PPWNO1bVTWy8NSg2gj/uNvShOQhv6Txaos+QyUAdm2OKZpXi+ms7/DUi5nUnT8/Ws+YsCPMM7WeonnQGQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hekLqH7z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hekLqH7z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8193C4CEF1;
	Sun, 25 Jan 2026 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769351964;
	bh=ul3zI6m3/E/j0CtfDBenVrsXomXj71j6tkFREgyaXoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hekLqH7zih8X4Y89cR5ioIiEhPSnBHxNoxVov8Giyr07yMM6uAGf7spzhAT+nrntB
	 MVWIprG/z8ZFmB/+Ucgk1xQELkCQygcN0/eIaTOKOogFEivZvazhWPYmhupkNwwAdn
	 uKWOrJoxsA7Ycvd1+LISz0rtvV+XxK0J0ydxPfNA=
Date: Sun, 25 Jan 2026 15:39:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: john ashrith6 <johnashrith6@gmail.com>
Cc: workflows@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: clarify CC list guidance wording
Message-ID: <2026012556-majestic-traitor-8f03@gregkh>
References: <CABoKZACHObTMAC5FMvhRG3Guev_s_Pys_t3G7LAqF7BTiLD+KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABoKZACHObTMAC5FMvhRG3Guev_s_Pys_t3G7LAqF7BTiLD+KQ@mail.gmail.com>

On Sun, Jan 25, 2026 at 08:08:08PM +0530, john ashrith6 wrote:
> This patch clarifies wording in the CC list guidance to avoid ambiguity.
> 
> No functional changes intended.
> 
> >From 416237c2cea7ccb4fa863ebc260777ea102b2b62 Mon Sep 17 00:00:00 2001
> From: JAR2004re <johnashrith6@gmail.com>
> Date: Sun, 25 Jan 2026 14:17:13 +0000
> Subject: [PATCH] docs: clarify CC list guidance wording

No need for this to be in the body of the email/changelog.

> Signed-off-by: JAR2004re <johnashrith6@gmail.com>

Please use your name here, not your alias.

thanks,

greg k-h
