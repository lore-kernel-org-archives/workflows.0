Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20AE5229
	for <workflows@vger.kernel.org>; Thu, 23 Nov 2023 02:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0kdxs5BK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 877D6C433C7;
	Thu, 23 Nov 2023 02:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700708025;
	bh=rRbIXqjq8DKBA6vW+7glleky65j8TQodsqrm6IeWtY0=;
	h=Date:From:To:Subject:From;
	b=0kdxs5BKjZoa8zbdF0eczJBxbs8m8YnYTyKgkkEu+eSNAco8eMynkqRxgH7GcM5av
	 FLosBRhqHzptPjpDhJp16VoWLl0J0jcuJap+15UA2/nU6DKqrygteaSqLAoo6edQuV
	 e1NH45/yqd3ROU+mTGog5JGZ9L2XSG3DE6N1a98I=
Date: Wed, 22 Nov 2023 21:53:44 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: workflows@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231122-fierce-caracal-from-vega-445ec5@nitro>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to the new vger infrastructure. No action is
required on your part and there should be no change in how you interact with
this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K
