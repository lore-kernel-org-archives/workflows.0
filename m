Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC5F27A468
	for <workflows@vger.kernel.org>; Fri, 30 May 2025 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748633527; cv=none; b=TG2w2alxVxXFx4L/1B4TYKUCNHHryw+rMGwbxug8z/fuefg2PGoUcISByqbvaKn0jFAiAUnX+qREShyyPYbbSauuxBdVlaQ0VuuhDDDpK6cz6kqIx3ZJn5SaLZGLsHtv5jY1safMiU5pIi6ARDEObAuAbvLK2TjSk0baMjTvJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748633527; c=relaxed/simple;
	bh=2T/5TbpA1ZxDq3H3vWcFlCbUMlkFWHPS2ZMs5p4tTjg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOK2rAJ54lV/JruBjX/uizBoLjjfPad02TBfDAxBfcdnN+KWYlcI6O58lf99A6//XRj272+ABsXajgcK0Z3j0EagkOTY2VNlnMMkCgwwaHMT2mx44UHQDYAcx9hA3NaXaSlgXv6ZHdwQTDL4pwCZVBa/K8NzcU7K3O1jbcvdhyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IDMDPu4h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IDMDPu4h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10741C4CEEA
	for <workflows@vger.kernel.org>; Fri, 30 May 2025 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748633527;
	bh=2T/5TbpA1ZxDq3H3vWcFlCbUMlkFWHPS2ZMs5p4tTjg=;
	h=Date:From:To:Subject:From;
	b=IDMDPu4h2Powqqf7IZMcWh6Sllfwl6LeIm4cQmMgoCtxxyWivaOXICJorHs7/YXmF
	 nqtOX1704hwQiFSvftsoODp9kafaesFQ9Tlaj5JSgCcOwCP6JfxsN165KBqacVr4zc
	 z6c7vtx+eU62+t+HT7MtZ5vbT9uhJ9uFYOVKx6hIc77cDLthk1ca8eUzl/i6CBgKAC
	 MNwlJ5IvWxTRfb9SiltxF3KaKqnzOkdiVVdG9hCHXC6O+ryd3eh6yNTWEgH/B4oGl2
	 nguxy/ZOMXMlqyFIuvGtTTKrcHk/qIaaGhTFlSbcaaDkGq9cAPkVAhVMJanMcqCWYU
	 vd0Rbf0jRz1Mw==
Date: Fri, 30 May 2025 12:32:04 -0700
From: Kees Cook <kees@kernel.org>
To: workflows@vger.kernel.org
Subject: Fcc with "git send-email"
Message-ID: <202505301222.55018E78@keescook>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'm just curious if anyone has found a workable solution for getting
"Sent" folder copies of emails sent with "git send-email" (or similar
tools that throw everything into "sendmail -i"). I'd really like my
patches to show up in my "Sent" IMAP folder, but I only get this if I
use my MUA directly (in my case, mutt).

I'm thinking it might be possible set git's --sendmail-cmd= to a script
that wraps "mutt -H ..." or "mutt -x ..." but I'm not having much luck.

Has anyone else done this?

-- 
Kees Cook
