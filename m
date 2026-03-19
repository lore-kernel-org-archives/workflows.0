Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FF4359A98
	for <workflows@vger.kernel.org>; Thu, 19 Mar 2026 14:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773929844; cv=none; b=nIreUc0Ct3JUmoi4SGziqC97Y6q6GFXl/sZTUK8vkS+lOdSC95roK3Pfwi8hbBa3Aj6r2dzS5u4sSAdHzwBT0DslL8OJHpFuZJVyDhOtOl8Cf/6JecQfp74srq1/+w0pFnmJY+n52mtb40aqiUYgH6m6ncDVMm6SqjK+7NMlrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773929844; c=relaxed/simple;
	bh=YNGZJ6XCgjAwYGlSCtIo9lbxg1XznFBN6PvEWeER8ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q0LljJNRpDCPIh0WV4ZHEdjwLObAxYy+PVl3ppTwrjlPfx0uThO2od8DY//vQiiuIy4ur1jCJsYdcgsVBxWhQvKS/kcv+JLPhutqsMkRDCb30Qw9slf9h6xOYGL5TMFVQLLng24qc9r5WEfXpaStL2we5RZYSd+V9w1nlrCPOco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=YYnUGP2Y; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="YYnUGP2Y"
Received: from macsyma.thunk.org (pool-173-48-82-102.bstnma.fios.verizon.net [173.48.82.102])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 62JEGY3h014315
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Mar 2026 10:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1773929798; bh=QuVo8WgC5e4f9ry0DKcs1GXKCBbv3o6T5S0V/1huSK8=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=YYnUGP2YTrIH/xDmvNY5ECQpgjkAn16edDOJaghE4MEck9YLOziKudTuxfVyZZLJu
	 n3RBwSSo1S88LHOjYuh2nhSEvTsGEDCzJogN9B6a1OYSHidMBQRQQyFLHk9poE6zev
	 fY0qHdGEZJP4Jsc2cHyTp3chB0P5GorgiGhBLpCCanj8uHGTFRNGGuGAWAmSRr85xe
	 7X52yB8GqE9C9U9u2o4ZkgVFJlo4gQ+MH5e1MijloB1Uv820pOQtxsN76AomR2NPgd
	 dlU01ed1T3GfyG+2feyrd5gRBb1Is2bD+LZ3UQ4hpgSZCISTgBLTWpHEm0CKmpuoyf
	 eFQMX05+xw0lg==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id A212E5E4A73F; Thu, 19 Mar 2026 10:15:34 -0400 (EDT)
Date: Thu, 19 Mar 2026 10:15:34 -0400
From: "Theodore Tso" <tytso@mit.edu>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Guillaume Tucker <gtucker@gtucker.io>,
        Ben Copeland <ben.copeland@linaro.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        workflows@vger.kernel.org, automated-testing@lists.yoctoproject.org,
        "kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Subject: Re: Hosting first-party kernel.org container images
Message-ID: <20260319141534.GB91368@macsyma-wired.lan>
References: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
 <CAL0q8a7mepGUdgrLsQhCUdLVP8VcxB9x_oBRCWAYNeoVAUb=7A@mail.gmail.com>
 <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>
 <CANiq72=t=q4__vwTFjg+gQyjKLUEJrZBngr3cAnnKiTNM5uteg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72=t=q4__vwTFjg+gQyjKLUEJrZBngr3cAnnKiTNM5uteg@mail.gmail.com>

On Thu, Mar 19, 2026 at 12:10:19PM +0100, Miguel Ojeda wrote:
> 
> While many kernel developers may not use them (mostly because everyone
> has their own setup already), if we had a set of "base" images that
> are maintained by someone trusted (including publishing them in the
> usual registries for easy use), then I think a bunch of us would
> actually use them for CI and possibly other tasks; just like some of
> us already use the kernel.org toolchains "manually" anyway etc.

I publish test appliance images suitable for use by kvm-xfstests and
android-xfstests on www.kernel.org[1], and have for years.  A
description of how they are generated, and what I do in order to keep
the GPL complaint can be described in this slide deck[2].  In
particular, note how I am very careful to explicitly specify where the
corresponding source can be found in a README file[3].  This is
required by the GPL, so that someone can recreate the binary image
using the exact sources that were used to generate them.  I've noted
that not all container / docker images seem to follow the letter of
the law, and fortunately various groups such as the SFLC hasn't gone
after people who publish these images.... but I think it's better to
be careful about such things.

[1] https://www.kernel.org/pub/linux/kernel/people/tytso/kvm-xfstests/
[2] https://thunk.org/gce-xfstests
[3] https://www.kernel.org/pub/linux/kernel/people/tytso/kvm-xfstests/README

My kvm-xfstests images are relatively small, and I don't update them
all that often, so I haven't had any complaints from the folks who
manage kernel.org about.  So aside from the GPL compliance issues, if
you think that you might be making a large number of images, which
might be potentially large, you might want to check with them first.

Cheers,

					- Ted
