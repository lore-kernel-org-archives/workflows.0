Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7C212542;
	Fri,  6 Feb 2026 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770387643; cv=none; b=RRilEIYEM129XGL6yLX0cMiRLxNgL31g0AA4SoKo6e3Neq4X+n1yKYuL/xfZAB4awwZ290bwK/ThHAKF3cXlMUYjhhTfmBFaTOYDXK6X88V9h1pYHJsblwcV1ecFuyInwgf5C8TJzLHMS0aYJc19HL9+IYqmVSZdCji5BRdevMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770387643; c=relaxed/simple;
	bh=osDICSbP91q/H/zGn1e7ih3r/sIimL8SLGHT+/txPtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyIPS4Kg5ZTYfqRecQ0zkejMTd/J/QN7WRzph3Gi1CX09HaUGiLiraIl9iiuc7adGPFj/uFIpXjT0abtwQLg4UGi1Ho9fsFCO1cNAtYxLZbjvVzHUT4x/fisZOFejYBmpu/kbxGB1yvDfwaLO4KtgPr+WQDLMrra07sAH0vP4xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SThrP9UM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SThrP9UM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65909C116C6;
	Fri,  6 Feb 2026 14:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770387642;
	bh=osDICSbP91q/H/zGn1e7ih3r/sIimL8SLGHT+/txPtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SThrP9UMc7G/CANDPQICfAMT8ncw1llVEsrbdvH/ybb3UGTVJqRADHZm/qZi9QhyD
	 X8HTx6mbtwfVvsHWGVN0mmRK5c07GVB9vMEXKGKZiqYsHt5+vtATbMV3o4M0G/U/c7
	 VhdXJdv5Cwry+/PUK//nrFckqTteNXEMenpqgaTE=
Date: Fri, 6 Feb 2026 09:20:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Amitabh <amitabh@amidevlab.com>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: process: maintainer-pgp-guide: update
 kernel.org docs link
Message-ID: <20260206-fluorescent-straight-partridge-cf42ef@lemur>
References: <20260205115554.7795-1-amitabh@amidevlab.com>
 <875x8bi6su.fsf@trenco.lwn.net>
 <E285CDA1-776F-44AF-9C6D-AB43F4EC5054@amidevlab.com>
 <87sebfgqdf.fsf@trenco.lwn.net>
 <3AB51D59-A054-4847-91CD-DFF3A2EB5F04@amidevlab.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3AB51D59-A054-4847-91CD-DFF3A2EB5F04@amidevlab.com>

On Fri, Feb 06, 2026 at 12:02:00AM +0530, Amitabh wrote:
> > I am aware of kernel documentation practices :)  "Typically licensed"
> > does not tell you what any individual contributor intended, though.
> > *Probably* that tag is OK, but you should really consult with the
> > original author of that page to ask what their intent was.
> 
> You are absolutely correct. In fact, the original author, Konstantin Ryabitsev,
> (in TO here) responded to my v1 patch in the affirmative regarding the changes.
> (https://lore.kernel.org/all/177006480695.901069.1641199463436529014@lemur/)

Yes, that matches the intended license.

-K
