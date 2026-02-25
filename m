Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A894733C189
	for <workflows@vger.kernel.org>; Wed, 25 Feb 2026 22:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772059005; cv=none; b=LQsvl/g/OcCM+akrVZX343sBbmWhVQSqpNGC3MF/v2/TQ4f3LGQE21HXFdyb0gW61IE/PtQPoR0X3Khk4iqlYN0T+zGxnaJaNsqhIJ9ZuSuZNqC4SV1JnyMEUurUcAF0rlzS0dZr8+fSIwxY7yWVW3p4Z6asNi6JZazgzsLCJbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772059005; c=relaxed/simple;
	bh=suR3dC1gg6ZwEU/0MzFCdi4XPDM7vdgPamCLxlL+8sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAIwW0oBEPhfKpmsqHxxwRkeJjJK2abU0nCguFC+z9E9L92t6G/DRORbvErdrAU2JiOviogE/IxBs7kmHiJHqgvPPcfA1wm6if9heloKDjM8MJHg9BQFB4J3ITFx8UanNzPFpOmwLOgCdOgUCzjHDT2pdCyBWWLdOYdh7dGbEZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=ZalnbpIe; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="ZalnbpIe"
Received: from macsyma.thunk.org (pool-173-48-102-61.bstnma.fios.verizon.net [173.48.102.61])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 61PMZdah018711
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 17:35:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1772058952; bh=oQYsL+5RkrTJ3nDjLbr/WyhbaiV7iBuzpnktk+IeTDA=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=ZalnbpIe7T1mX/5lFBaJ7dBFbShDpTie54CVUA8Wtf+Ak4ASnCkIA3LPasWvDcOKb
	 Cz4wzMizlN6Rg8FNaBM0zit/fXsRIn6NDRin04MYVpZ5oe7wJ3YkHud3ZyYgJoH/5K
	 kA2Wf2HVwVX3pneHqL5sgHLYT2oUZ40MhsNyR6PDw36+ceold2akgZBCaQMLwBRMir
	 pnfQe6PG7azxFM2lcaOnMI2qPVbX5fm61NGQ3UDIBVuKY3vQiZq2VGxIbYIoGTIldr
	 lLDQ6fePmJmZBkUL0TDOhA6dTBCq9QgfxyK5/QfiTa8xPB9MnJgjTCWXNpOvZP1nj5
	 qq+79KDALNrhA==
Received: by macsyma.thunk.org (Postfix, from userid 15806)
	id 8A27659E0B65; Wed, 25 Feb 2026 17:35:39 -0500 (EST)
Date: Wed, 25 Feb 2026 17:35:39 -0500
From: "Theodore Tso" <tytso@mit.edu>
To: Alejandro Colomar <alx@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
        Sasha Levin <sashal@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com,
        kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tech-board-discuss@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <20260225223539.GD16846@macsyma-wired.lan>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
 <aZ87Z24f9HZsofGl@devuan>
 <2026022539-commotion-huskiness-8736@gregkh>
 <aZ9p2RMrJL1mQ10w@devuan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ9p2RMrJL1mQ10w@devuan>

On Wed, Feb 25, 2026 at 10:45:48PM +0100, Alejandro Colomar wrote:
> The date gives more information to humans to decide if the commit is
> important to look up.  Sometimes, a subject can be ambiguous to the
> human, even if it's not ambiguous to a machine.  The date can help give
> some context to a human.  For example, one could relate a commit to a
> series that was merged around that date.

I'm really confused under what circumstances the date would ever be
*useful* to me.  In general, what I want to know is "is this fix
applicable to a branch I care about", which basically means I want to
know if a particular branch (a) has the commit id, or (b) has a commit
whose description contains a "commit upstream" line referencing the
commit.

The date is almost never interesting to me.  For upstream commits in
Linus's tree, the hint:

   Cc: stable@kernel.org # 6.8+

Is a bit more interesting to me, but so long as there's a fixes tag
with a commit ID, I can just do a "git tag --contains <commit-id>" to
get the same information.

					- Ted

