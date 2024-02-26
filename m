Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6915A1E878;
	Mon, 26 Feb 2024 22:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708987973; cv=none; b=Wkt7HrvkoEupjTesZM1ga5VAMEDQPIZ6SS3GoYmvxTOkiV/boPmO9hhu9bB85O97e163I6ym8trOSs7s0jadtZWiUn+MWCCe+behxFARjemNReyi8e3O+U0E1beuA9d/CQdfy0gRSuDuCeUeNDJ1X/1pYaVxaVxbSvwlxTT+vSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708987973; c=relaxed/simple;
	bh=aVfUJN7ZrtESWGumta3ey0Rwz4iAPlXl3DtmVnzYO3I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hnvhZFJBUPwVu3Oqr5+cU3EfOHERgSHLhUGGyJYNQ0HMP0fAo6RrlTrfhJAJ8xN+KwljEmU/x7ySKNorDAwLqWhdvsXiZ94SuhlgcoqAcSr4Ig16ViHUmbi0Ji09Kj4FqQlSuUNCgUa3Uc4Ziycw8S+yKu3QagSNe8+9RFB6WxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUO1z7ws; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUO1z7ws"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFF3C433C7;
	Mon, 26 Feb 2024 22:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708987973;
	bh=aVfUJN7ZrtESWGumta3ey0Rwz4iAPlXl3DtmVnzYO3I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pUO1z7wslM2ZcMwmxmTk2dcKtcILzTXyu1+HOt0WmXuQmqyPZROzw2nGt444ORpxh
	 PseDthe+mQ3pGLcNTd0ifnQmQmRcc7z4M5dQuIggbZFzCTGWGDKSx5nqKVchcvzf1a
	 vvdrN3i9GSeZS55EyksRw9I764XPpkjGuJZNZNKHlbFf1KSD16DUzfXvLq6uwZSLis
	 dYPoyQl5E1QEpQus3GJBpEc9Rl0BEipaPRGfPrmkTnMF9EKZuNzs9cwFtJyrQtcGt+
	 LGddfaqvlwUU+dXNMgCACUwjKuWj799jP6PiqlzhCzd3AJLehWwhIbVTdo5+HEx9Is
	 VxzMM2vAgvVdQ==
Date: Mon, 26 Feb 2024 14:52:51 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, ast@kernel.org, linux-doc@vger.kernel.org
Subject: Re: Simple analytics for docs.kernel.org and patchwork, please?
Message-ID: <20240226145251.6335b6f6@kernel.org>
In-Reply-To: <875xyb2e18.fsf@meer.lwn.net>
References: <20240223083154.4fbee63c@kernel.org>
	<20240226-gainful-dark-snake-c15cf8@meerkat>
	<20240226114350.215be672@kernel.org>
	<875xyb2e18.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Feb 2024 12:58:43 -0700 Jonathan Corbet wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> > On Mon, 26 Feb 2024 14:24:39 -0500 Konstantin Ryabitsev wrote:  
> >> In general, my previous experience enabling libravatar on git.kernel.org has
> >> taught me that many very vocal people *really* don't like to have any kind of
> >> statistics gathered about them. However, if it's just for docs.kernel.org,
> >> then I don't think I have specific objections.
> >> 
> >> That said, I would need help turning this on -- if someone can pass me along a
> >> Sphinx configuration option that I can enable during build time, then I'll be
> >> happy to add it to our build jobs.  
> >
> > Excellent :)
> >
> > Let me CC linux-doc in case someone can tell us how to hook things in.  
> 
> It's probably not just a configuration option.  I suspect that this will
> need to be done either by editing the templates or with a little
> extension.  Either could require adding this support to the kernel repo,
> which might raise some eyebrows.

FWIW I tried poking around to insert "script_files" into conf.py,
because the RTD template does seem to have:

      {%- for scriptfile in script_files %}
        {{ js_tag(scriptfile) }}
      {%- endfor %}

But I only managed to add a pure "include" with just the 'src'
attribute on the <script> node, like:

	<script src="../../cabbage.js"></script>

We also need to set 'defer' and "data-domain="docs.kernel.org"'.
