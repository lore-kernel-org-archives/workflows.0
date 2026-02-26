Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D316F18C2C;
	Thu, 26 Feb 2026 00:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772064498; cv=none; b=l2SqrgohjxH9s5e704iGv7PokdhlWCWpV9R9/5SPOpXivSfkgFU5A8bp3thkKcYQDzgq8rHtND0pwUSthppNGiBSiEnflpP/1rBJzzhmHK1w6FdA0rpUdMnKBEcGdhSyVtvHtCIN0cDIU6DLPnhW2LsXL75W4gcT+mnqqxY+Jro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772064498; c=relaxed/simple;
	bh=LIVmqfqyJ9BRT857fdwIG5J2lDsqsZfpfHj2KMr68Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eWwwzcyjRWwlIaebKx97ht5xGYeBQ0nFnV+PWfoc53PCANZVjIEZWzEm1NrN8/orhn6lMjuoXQ4Dfo8qQUQ+NqkVV0Tz4JLws1DYXP9EiAbvrxKjqwQBRHmxNho4Dx43Vg44I+9pl+Put5i3fj/w2QQglKhxG6MMsdOPumx4Fgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf20.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 52BBF140134;
	Thu, 26 Feb 2026 00:08:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf20.hostedemail.com (Postfix) with ESMTPA id 4EBD120025;
	Thu, 26 Feb 2026 00:08:10 +0000 (UTC)
Date: Wed, 25 Feb 2026 19:08:02 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown
 <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Yeking@red54.com, kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Theodore Ts'o <tytso@mit.edu>, Andy Whitcroft <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn <lukas.bulwahn@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 tech-board-discuss@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <20260225190630.1834f850@fedora>
In-Reply-To: <aZ4_sBIy8rOUL59Q@devuan>
References: <aZ4_sBIy8rOUL59Q@devuan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: xonn7xurd1tu79dkak1hdxou93gtaest
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 4EBD120025
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19E4oro/lWGPUrYU6oREwALqxnaa76q3MQ=
X-HE-Tag: 1772064490-639392
X-HE-Meta: U2FsdGVkX1/j8QpzD8dnA7UrrMrQdfVkA8WnM1S4PClo/1xaEawjcTe40TS2J1hIN/IvTTl8So0WSsnv9xwEdf6uyn3VypUMwphFzl40YuCBQJwS4hggM0F7UVXrDxp4DAeD+vxMuvt9nEpWwyZFcuGxC7gS92eO3mZGYA1+uHwuCAlMYlrTIQZb2DuV0xPFhdfzjH0ANqQmpM5CkKiMEZ+NspB8j50YjCXmbNCx1ZrE3bgZXukk2y/KEiYvtWUmRFXzqD5ibYo/YZDS6lVpFdiG9fEuicgT2rukrfoFN/Gf+DbV5OnCbchcmVn32RbHzijKXvG9i+x7WWWB+kcqIcXPbY6dzK5M

On Wed, 25 Feb 2026 01:56:02 +0100
Alejandro Colomar <alx@kernel.org> wrote:

> That uses hash+subject.  This may be not enough in some cases (see how
> much subjects repeat, in the logs above).  And importantly, a fixes tag

Most of those repeats are merges. And people tend to use the same
subject when they merge commits. The only time a Fixes is for a merge
is if there was a merge conflict and it was done poorly.

> may become ambiguous *after* it has been written, so you can't predict
> much.
> 
> By having a commit date in the Fixes tag, you could even simplify the
> script to just do a binary search in case of ambiguity.  Let's say I
> want to find the following commit (arbitrarily taken from the first
> Fixes tag I've found in my copy of linux.git):
> 
> 	a2e459555c5f (2023-08-09; "shmem: stable directory offsets")
> 
> We could find it, with a trivial command line.  We only even need two
> characters of the hash:
> 
> 	$ git log --oneline --after='2023-08-08' --before='2023-08-10' \
> 	| grep ^a2;
> 	a2e459555c5f shmem: stable directory offsets

Why not just git show a2e459555c5f? You're just worried because of
conflicts? That happens so seldom doing a bit more work to find the
task is less work than every developer adding a useless date in the tag.

Even if there are conflicts, git show shows you all the commits that conflict:

  (random example)

$ git show cbced
error: short object ID cbced is ambiguous
hint: The candidates are:
hint:   cbced93894d1 commit 2026-02-02 - drm/amd/display: Set CRTC source for DAC using registers
hint:   cbced0de1ae7 tree
hint:   cbced35df940 tree
hint:   cbced38b00f6 tree
hint:   cbced53122ce tree
hint:   cbced7856638 tree
hint:   cbced88f5140 tree
hint:   cbceda69074d tree
hint:   cbcedadcc0f9 tree
hint:   cbced8ff29d4 blob
hint:   cbcedd7a684b blob

The above only has one with a subject.

> 
> No need for a huge script to disambiguate.  This is even typo-resistant,
> as one could eventually find something that is similar enough, if one
> had such a field with a typo (in any of the three fields).  You'd be
> able to search by the other two fields, and two fields should be
> _usually_ enough for disambiguating, and the third one could corroborate
> the typo.
> 
> So, what would you think of having the commit date in commit references
> such as Fixes tags?

NAK. I really see no purpose for it, and just adds added noise to the
Fixes tag. Seriously, your example above:

 	a2e459555c5f (2023-08-09; "shmem: stable directory offsets")

Looks horrible compared to:

 	a2e459555c5f ("shmem: stable directory offsets")

You are the first one to complain about needing a date here. Who else
finds this useful in the kernel community? It really feels like it's a
solution looking for a problem.

Sorry,

-- Steve

