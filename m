Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6C42451D5
	for <workflows@vger.kernel.org>; Mon, 13 Jan 2025 14:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778187; cv=none; b=WaZ2OM5JEY/iKCLN3escN3pRL6N+FGiy/VVQHGaWAZFL9KojmalJbN6Rj7vpzdXq5mxVhlCSq7oCBygMap1Y9MTF3YM/LVd3swH2xN9Tpu23on+NnxN+g3rdjxRQqolytX9sjeGb9y6QcTvV9BFx0LP306hPqnbS1EAaVjz1aHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778187; c=relaxed/simple;
	bh=Ue7IpeGKdEqttVEdo1+8kypIk3UdbZzaV5vAo90tlnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nw19aOTREmHeKdGzVFDf4fWMDo+2t44EXl0pho/aE9tXU7CUsxM/Sgxae1k5Z2+WphBa865+V/hOPxGh55RHz4bapCf4n3zOIeQmWA4ivboXhWQESvnTIjkQ61DMB81Ktq9ZmrBkA1P711eYyUF90gerL/uC3N2z231Jcw+yQbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b=Lmj2sLub; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mit.edu header.i=@mit.edu header.b="Lmj2sLub"
Received: from cwcc.thunk.org (pool-173-48-82-229.bstnma.fios.verizon.net [173.48.82.229])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 50DEMRLT014587
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 09:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1736778151; bh=UJjM2o1/E9ebHA64FVUbvgc5GyrFLYRxAIXUueekTvU=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=Lmj2sLubBx9XAcN0p90YwYjzbMRRibLGJWvLBFSH0yKCWsQtBIbKNrrODZ4XXnHg7
	 YHf+TtGbznJitGkSmTDCEY0DkmhMJDDmdiw37nkAZoQiTIkFJeEmbxIU+qK0+GLgck
	 Hxda4+oymUhqwQhRMa71mykD5Tm5UzriQuDtTcJpGacWIhkGaGxer6xuRw9132sRec
	 R7TmVZ3HVNRHT2x8aSJpMWKORVPyVr7Y9Ywyljo44DPED6YQuHL1QdFFTF18RxeFUI
	 ZBawocatzf/Xq3UwYYz2gZPcZ7iqhC3qbVWpv7xR32cPGqc5/6mKdKnH7/Y+BLr+gO
	 ehavysvPuJlFA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id B353D15C0135; Mon, 13 Jan 2025 09:22:27 -0500 (EST)
Date: Mon, 13 Jan 2025 09:22:27 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: Neal Gompa <neal@gompa.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        Sami Tolvanen <samitolvanen@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        tech-board@groups.linuxfoundation.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 3/3] docs: submitting-patches: clarify that signers may
 use their discretion on tags
Message-ID: <20250113142227.GE1514771@mit.edu>
References: <20250112152946.761150-1-ojeda@kernel.org>
 <20250112152946.761150-4-ojeda@kernel.org>
 <CAEg-Je-Knta8BtYSbZgX8cZ9Gd-2cpDAUE83dCJZbTbqmSfcKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEg-Je-Knta8BtYSbZgX8cZ9Gd-2cpDAUE83dCJZbTbqmSfcKA@mail.gmail.com>

On Sun, Jan 12, 2025 at 10:47:02AM -0500, Neal Gompa wrote:
> 
> A tag must not be dropped without the tag submitter's authorization.
> Otherwise it doesn't matter what you write here, the submitter *will*
> feel unwelcome.
> 
> It is rude and discouraging to do so without their acceptance of doing so.

In some cases, if the reviewer hasn't taken the less than subtle hints
that their reviews are unwelcome and are discouraging patch
submitters, as far as I'm concerned, if they feel unwelcome, that is a
*feature* and not a *bug*.

I'm not saying that is the case for you, but there are reviewers that
add negative value in the ecosystem.  The assumption that all tag
submitters are people that need to feel welcome might mostly true, but
it is not always the case.  This is why it MUST ultimately be up to
the maintainer.  I do not want the rules that force me to reward
people that should be discouraged, not encouraged.

						- Ted
